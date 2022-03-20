import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
part 'img_to_txt_model.freezed.dart';

@Freezed()
class ImgToTxtModel with _$ImgToTxtModel {
  const factory ImgToTxtModel({
    String? text,
    File? image,
    @Default(false) isProcessing,
    InputImage? inputImage,
  }) = _ImgToTxtModel;
}
