import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'biography_state.dart';
part 'biography_cubit.freezed.dart';

class BiographyCubit extends Cubit<BiographyState> {
  BiographyCubit() : super(const BiographyState());

  Future<void> loadData() async {
    try {
      emit(state.copyWith(isLoading: true, messageError: ''));

      await Future.delayed(const Duration(seconds: 1));

      final mockProfile = BioProfile(
        name: '홍길순',
        birthYear: '1992',
        location: '대한민국 · 서울',
        bio: '인공지능의 기술적 진보보다 인간 감정의 구조에 관심을 두었으며, 이후 독립 연구자로 활동했다. ',
        tags: ['인공지능 발명가', '세계 AI 윤리상', '대한민국 과학기술대상'],
      );

      final mockEvents = [
        BioEvent(
          year: '2017',
          title: '정서적 맥락 추론 모델 (Emotive Context Model)',
          description:
              '시와 일기, 대화체를 포함한 1,800만 건의 감정 텍스트 데이터를 기반으로,  언어 속 정서적 전이(transition of emotion)를 계산하는 모델을 구축했다.  이는 이후 감정 예측 알고리즘의 기초가 되었다.',
        ),
        BioEvent(
          year: '2038',
          title: 'E-01 프로토타입 발표',
          description:
              'E-01은 인간의 음성 떨림, 시선의 이동, 대화의 침묵 구간을 분석해  “언어 외적 정서 상태”를 감지·응답할 수 있었다.  공개 시연에서 한 연구원이 눈물을 흘리자, E-01이 “당신의 말을 기다릴게요”라고 대답해 전 세계 언론의 주목을 받았다.',
        ),
        BioEvent(
          year: '2045-2060',
          title: '사회적 영향 ',
          description:
              'EP-Net은 의료 상담, 분쟁 조정, 외교 협상 등 다양한 영역에 적용되었다.  2051년, 유엔(UN)은 ‘공감형 협상시스템(ENS)’을 공식 도입하며  전쟁 예방 협약의 일부를 AI 중재로 대체했다.  이 시기를 학계에서는 “감정기반 의사결정 시대”의 시작으로 본다.',
        ),
      ];

      emit(state.copyWith(
        isLoading: false,
        profile: mockProfile,
        events: mockEvents,
      ));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, messageError: 'Đã có lỗi xảy ra: $e'));
    }
  }
}
