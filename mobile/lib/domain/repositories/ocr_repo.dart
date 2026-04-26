import 'dart:io';

import 'package:base_flutter/data/models/self_id/ocr_card_id.dart';
import 'package:base_flutter/data/models/self_id/ocr_model.dart';
import 'package:base_flutter/data/models/self_id/ocr_passport.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ocr_repo.g.dart';

@RestApi()
abstract class OcrRepo {
  factory OcrRepo(Dio dio, {String baseUrl}) = _OcrRepo;

  @POST('/general')
  @MultiPart()
  Future<OcrResponse> generalOcr({
    @Header('X-OCR-SECRET') required String secretKey,
    @Part(name: 'file') required File file,
    @Part(name: 'message') required String message,
  });

  @POST('/document/id-card')
  @MultiPart()
  Future<OcrDocumentIdCardResponse> idCardOcr({
    @Header('X-OCR-SECRET') required String secretKey,
    @Part(name: 'file') required File file,
    @Part(name: 'message') required String message,
  });

  @POST('/document/passport')
  @MultiPart()
  Future<OcrDocumentPassportResponse> passportOcr({
    @Header('X-OCR-SECRET') required String secretKey,
    @Part(name: 'file') required File file,
    @Part(name: 'message') required String message,
  });
}
