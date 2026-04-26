package com.chon.api.service.impl;

import com.chon.api.common.enums.ECommon;
import com.chon.api.entity.BankIconEntity;
import com.chon.api.model.bank.icon.BankIconDTO;
import com.chon.api.model.mess.MessModel;
import com.chon.api.repository.BankIconRepository;
import com.chon.api.service.BankIconService;
import com.chon.api.service.ImageService;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@Service
public class BankIconServiceImpl implements BankIconService {

    private final BankIconRepository bankIconRepository;
    private final ImageService imageService;

    public BankIconServiceImpl(BankIconRepository bankIconRepository,
                               ImageService imageService) {
        this.bankIconRepository = bankIconRepository;
        this.imageService = imageService;
    }

    @Override
    @Transactional
    public MessModel createOrUpdateBankIcon(List<BankIconDTO> request) {

        if (request == null || request.isEmpty()) {
            throw new RuntimeException("INVALID REQUEST");
        }

        // 1. Lấy danh sách bankName
        List<String> bankNames = request.stream()
                .map(BankIconDTO::getBankName)
                .filter(Objects::nonNull)
                .distinct()
                .toList();

        // 2. Lấy danh sách icon cũ
        List<String> oldIconFiles =
                bankIconRepository.findIconPathsByBankNames(bankNames);

        // 3. Xoá ảnh cũ
        oldIconFiles.forEach(imageService::deleteImage);

        // 4. Xoá DB
        bankIconRepository.deleteByBankNames(bankNames);

        // 5. Lưu ảnh mới + insert DB
        List<BankIconEntity> entities = request.stream()
                .map(dto -> {
                    String fileName = null;
                    try {
                        fileName = imageService.saveImage(dto.getIconPath());
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                    if (fileName == null) {
                        throw new RuntimeException("SAVE IMAGE FAILED");
                    }
                    return new BankIconEntity(
                            null,
                            dto.getBankName(),
                            fileName
                    );
                })
                .toList();

        bankIconRepository.saveAll(entities);

        return new MessModel(ECommon.RESPONSE_STATUS.SUCCESS);
    }

    @Override
    public List<BankIconDTO> getList() {
        List<BankIconEntity> entities = bankIconRepository.findAll();

        return entities.stream()
                .map(entity -> {
                    BankIconDTO dto = new BankIconDTO();
                    dto.setId(entity.getId());
                    dto.setBankName(entity.getBankName());
                    dto.setIconPath(entity.getIconPath());
                    return dto;
                })
                .toList();
    }
}

