package com.chon.api.service.impl;

import com.chon.api.common.AppProperties;
import com.chon.api.common.anotations.UsersContext;
import com.chon.api.common.constans.ErrConstans;
import com.chon.api.common.enums.ECommon;
import com.chon.api.config.exception.custom.IAException;
import com.chon.api.config.rest.helper.ListJson;
import com.chon.api.entity.CardInfoEntity;
import com.chon.api.entity.ClanInfoEntity;
import com.chon.api.entity.EventEntity;
import com.chon.api.entity.EventVisitLogsEntity;
import com.chon.api.entity.TaekwondoInfoEntity;
import com.chon.api.entity.UsersEntity;
import com.chon.api.model.event.*;
import com.chon.api.repository.CardInfoRepository;
import com.chon.api.repository.ClanRepository;
import com.chon.api.repository.EventRepository;
import com.chon.api.repository.EventVisitLogsRepository;
import com.chon.api.repository.TaekwondoRepository;
import com.chon.api.repository.UsersRepository;
import com.chon.api.service.EventService;
import com.chon.api.service.ImageService;
import com.chon.api.utils.EncryptionUtils;
import com.chon.api.utils.QRCodeGenerator;
import com.chon.api.utils.StringBaseUtils;
import com.chon.api.utils.UrlGenerator;
import com.chon.api.utils.mapper.ModelMapperUtils;
import com.google.zxing.WriterException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.function.Function;

@Service
@Slf4j
public class EventServiceImpl implements EventService {
    @Autowired
    AppProperties appProperties;

    @Autowired
    EventRepository eventRepository;

    @Autowired
    EventVisitLogsRepository eventVisitLogsRepository;

    @Autowired
    ImageService imageService;
    @Autowired
    private UsersContext usersContext;
    @Autowired
    private UsersRepository usersRepository;
    @Autowired
    private ClanRepository clanRepository;
    @Autowired
    private CardInfoRepository cardInfoRepository;
    @Autowired
    private TaekwondoRepository taekwondoRepository;


    @Override
    public Long createNewEvent(CreateEventRequestModel request) throws IOException {
        EventEntity eventEntity = new EventEntity();
        eventEntity.setTitle(request.getTitle());
        eventEntity.setDescription(request.getDescription());
        eventEntity.setEventDate(request.getEventDate());
        eventEntity.setTimeFrom(request.getTimeFrom());
        eventEntity.setTimeTo(request.getTimeTo());
        eventEntity.setLocation(request.getLocation());

        eventEntity.setCreateDate(new Date());

        if (request.getImageBase64() != null && !request.getImageBase64().isEmpty()) {
            String imagePath = imageService.saveImage(request.getImageBase64());
            eventEntity.setImagePath(imagePath);
        }
        eventEntity = eventRepository.save(eventEntity);
        return eventEntity.getId();
    }

    @Override
    public ListJson<EventModel> getListEvent(Integer pageIndex, Integer pageSize) {
        Pageable pageable = PageRequest.of(pageIndex - 1, pageSize);
        Page<EventModel> pageData = eventRepository.getListEvent(pageable);
        List<EventModel> data = pageData.getContent().stream().peek(res -> {
            String url = null;
            if (!StringBaseUtils.isNullOrEmpty(res.getImagePath())) {
                Map<String, String> params = new HashMap<>();
                params.put("path", res.getImagePath());
                try {
                    url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
                } catch (UnsupportedEncodingException e) {
                    log.error("has error when gen link view image", e);
                    url = "";
                }
            }
            res.setImagePath(url);
        }).toList();
        return new ListJson<>(data, pageData.getTotalElements());
    }

    @Override
    public EventModel getDetail(Long id) throws IOException, WriterException {
        EventEntity entity = eventRepository.findById(id).orElseThrow(
                () -> new IAException(ErrConstans.EVENT_NOT_EXISTED)
        );
        EventModel eventModel = ModelMapperUtils.toObject(entity, EventModel.class);

        // link view anh
        String image = null;
        if (!StringBaseUtils.isNullOrEmpty(eventModel.getImagePath())) {
            Map<String, String> params = new HashMap<>();
            params.put("path", eventModel.getImagePath());
            try {
                image = UrlGenerator.encodeUrlSafe(appProperties.baseUrlViewImage, params);
            } catch (UnsupportedEncodingException e) {
                log.error("has error when gen link view image", e);
                image = "";
            }
        }
        eventModel.setImagePath(image);

        //gen link qr event
        String token = EncryptionUtils.encrypt(String.valueOf(entity.getId()), appProperties.encryptKey);
        Map<String, String> params = new HashMap<>();
        params.put("token", token);
        String url = "";
        try {
            url = UrlGenerator.encodeUrlSafe(appProperties.baseUrlShareLinkEvent, params);
        } catch (UnsupportedEncodingException e) {
            log.error("Error generating share link", e);
        }

        String base64Encoded = QRCodeGenerator.generateQRCodeBase64(url, 300, 300);
        eventModel.setQrBase64("data:image/png;base64," + base64Encoded);
        return eventModel;
    }

    @Override
    public String redirectToAppOrStoreEvent(String token) throws IOException {
        String tokenDecode = EncryptionUtils.decrypt(token, appProperties.encryptKey);

        ClassPathResource htmlFile = new ClassPathResource("templates/redirect.html");

        String htmlContent = StreamUtils.copyToString(htmlFile.getInputStream(), StandardCharsets.UTF_8);

        htmlContent = htmlContent.replace("{{appKey}}", appProperties.appKey)
                .replace("{{type}}", ECommon.LINK_VERIFY_TYPE.EVENT.value)
                .replace("{{verifyType}}", tokenDecode)
                .replace("{{androidStoreUrl}}", appProperties.urlStoreAndroid)
                .replace("{{iosStoreUrl}}", appProperties.urlStoreIos);

        return htmlContent;
    }

    @Override
    public VisitEventResponsetModel visitEvent(VisitEventRequestModel request) {

        if (request.getCardId() == null) {
            throw new IAException(ErrConstans.VALIDATE_CARD_CARD_ID_NOT_NULL);
        }

        if (request.getEventId() == null) {
            throw new IAException(ErrConstans.VALIDATE_EVENT_ID_NOT_NULL);
        }

        if (request.getActionType() == null) {
            throw new IAException(ErrConstans.VALIDATE_EVENT_ACTION_TYPE_INVALID);
        }

        if (request.getActionType() < ECommon.EVENT_ACTION.CHECK_IN.value || request.getActionType() > ECommon.EVENT_ACTION.CHECK_OUT.value) {
            throw new IAException(ErrConstans.VALIDATE_EVENT_ACTION_TYPE_INVALID);
        }

        if (request.getCertificateType() == null) {
            throw new IAException(ErrConstans.EVENT_CERTIFICATE_INVALID);
        }

        //Khoi tao response
        VisitEventResponsetModel response = new VisitEventResponsetModel();

        //Kiem tra cetificate
        if (Objects.equals(request.getCertificateType(), ECommon.VERIFY_TYPE.CARD.value)) {
            CardInfoEntity cardInfoEntity = cardInfoRepository.findByIdAndIsDelete(request.getCardId(),ECommon.TYPE_DELETE.UN_DELETE.value);
            if (cardInfoEntity == null)
                throw new IAException(ErrConstans.CARD_INFO_NOT_EXIST);
            if (!Objects.equals(cardInfoEntity.getStatus(), ECommon.DIGITAL_SIGNATURE.YES.value)) {
                throw new IAException(ErrConstans.EVENT_CERTIFICATE_IS_NOT_CONFIRMED);
            }
            response.setBlockHeight(cardInfoEntity.getBlockHeight());
            response.setTxID(cardInfoEntity.getTxId());
        } else if (Objects.equals(request.getCertificateType(), ECommon.VERIFY_TYPE.CLAN.value)) {
            ClanInfoEntity clanInfoEntity = clanRepository.findByUserId(usersContext.getCurrentUserId());
            if (clanInfoEntity == null) {
                throw new IAException(ErrConstans.CLAN_NOT_EXISTED);
            }
            if (!Objects.equals(clanInfoEntity.getStatus(), ECommon.DIGITAL_SIGNATURE.YES.value)) {
                throw new IAException(ErrConstans.EVENT_CERTIFICATE_IS_NOT_CONFIRMED);
            }
            response.setBlockHeight(clanInfoEntity.getBlockHeight());
            response.setTxID(clanInfoEntity.getTxId());
        } else if (Objects.equals(request.getCertificateType(), ECommon.VERIFY_TYPE.TAIW.value)) {
            TaekwondoInfoEntity taekwondoInfoEntity = taekwondoRepository.findByUserId(usersContext.getCurrentUserId());
            if (taekwondoInfoEntity == null) {
                throw new IAException(ErrConstans.TAEKWONDO_NOT_EXISTED);
            }
            if (!Objects.equals(taekwondoInfoEntity.getStatus(), ECommon.DIGITAL_SIGNATURE.YES.value)) {
                throw new IAException(ErrConstans.EVENT_CERTIFICATE_IS_NOT_CONFIRMED);
            }
            response.setBlockHeight(taekwondoInfoEntity.getBlockHeight());
            response.setTxID(taekwondoInfoEntity.getTxId());
        } else {
            throw new IAException(ErrConstans.EVENT_CERTIFICATE_INVALID);
        }

        EventEntity eventEntity = eventRepository.findById(request.getEventId()).orElseThrow(
                () -> new IAException(ErrConstans.EVENT_NOT_EXISTED)
        );

        //Lay danh sach cac luot check in
        List<EventVisitLogsEntity> eventVisitIn = eventVisitLogsRepository.findByEventIdAndUserIdAndActionType(request.getEventId(), usersContext.getCurrentUserId(), ECommon.EVENT_ACTION.CHECK_IN.value);

        //Kiem tra xem neu la check out thi da check in chua
        if (Objects.equals(ECommon.EVENT_ACTION.CHECK_OUT.value, request.getActionType()) && eventVisitIn.isEmpty()) {
            throw new IAException(ErrConstans.EVENT_MUST_BE_CHECK_IN_BEFORE);
        }

        EventVisitLogsEntity eventVisitLogsEntity = new EventVisitLogsEntity();
        eventVisitLogsEntity.setUserId(usersContext.getCurrentUserId());
        eventVisitLogsEntity.setEventId(eventEntity.getId());
        eventVisitLogsEntity.setCertificateType(request.getCertificateType());
        eventVisitLogsEntity.setActionType(request.getActionType());
        eventVisitLogsEntity.setActionTime(new Date());
        eventVisitLogsEntity.setCreateDate(new Date());
        eventVisitLogsEntity.setCreateBy(usersContext.getCurrentUserName());
        eventVisitLogsRepository.save(eventVisitLogsEntity);

        if (Objects.equals(ECommon.EVENT_ACTION.CHECK_OUT.value, request.getActionType())) {
            response.setCheckOutTime(eventVisitLogsEntity.getActionTime());
            response.setCheckInTime(eventVisitIn.getFirst().getActionTime());
        } else {
            response.setCheckInTime(eventVisitLogsEntity.getActionTime());
        }
        return response;
    }

    @Override
    public List<CertificateResModel> certificates() {
        List<CertificateResModel> certificates = new ArrayList<>();
        Long userId = usersContext.getCurrentUserId();

        if (userId == null) {
            return Collections.emptyList();
        }

        addCertificateIfVerified(
                certificates,
                clanRepository.findByUserId(userId),
                "Family",
                ECommon.VERIFY_TYPE.CLAN.value,
                ClanInfoEntity::getStatus,
                ClanInfoEntity::getVerifyDate
        );

        addCertificateIfVerified(
                certificates,
                cardInfoRepository.findByUserIdAndIsDelete(userId,ECommon.TYPE_DELETE.UN_DELETE.value),
                "ID",
                ECommon.VERIFY_TYPE.CARD.value,
                CardInfoEntity::getStatus,
                CardInfoEntity::getVerifyDate
        );

        addCertificateIfVerified(
                certificates,
                taekwondoRepository.findByUserId(userId),
                "Taekwondo",
                ECommon.VERIFY_TYPE.TAIW.value,
                TaekwondoInfoEntity::getStatus,
                TaekwondoInfoEntity::getVerifyDate
        );

        return certificates;
    }

    private <T> void addCertificateIfVerified(
            List<CertificateResModel> certificates,
            T entity,
            String certificateName,
            Long certificateType,
            Function<T, Long> statusGetter,
            Function<T, Date> dateGetter
    ) {
        if (entity != null
                && certificateType != null
                && ECommon.DIGITAL_SIGNATURE.YES.value.equals(statusGetter.apply(entity))) {
            CertificateResModel certificate = new CertificateResModel();
            certificate.setCertificateName(certificateName);
            certificate.setCertificateType(certificateType);
            certificate.setCertificateDate(dateGetter.apply(entity));
            certificates.add(certificate);
        }
    }
}
