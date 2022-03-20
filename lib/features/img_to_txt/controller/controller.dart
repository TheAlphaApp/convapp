import 'dart:io';

import 'package:convapp/features/img_to_txt/models/img_to_txt_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

final languageProvider = StateProvider<TextRecognitionOptions>((ref) {
  return TextRecognitionOptions.DEFAULT;
});
final imgToTxtModelProvider =
    StateNotifierProvider.autoDispose<ImgToTxtNotifier, ImgToTxtModel>(
  (ref) {
    return ImgToTxtNotifier(ref.read, imagePicker: ImagePicker());
  },
);

class ImgToTxtNotifier extends StateNotifier<ImgToTxtModel> {
  ImgToTxtNotifier(this.reader, {required this.imagePicker})
      : super(const ImgToTxtModel());
  final ImagePicker? imagePicker;

  final TextDetectorV2 _textDetector = GoogleMlKit.vision.textDetectorV2();
  final Reader reader;
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await imagePicker?.getImage(source: source);
    if (pickedFile != null) {
      state = state.copyWith(
        image: File(pickedFile.path),
        inputImage: InputImage.fromFilePath(pickedFile.path),
      );
    } else {
      print('No image selected.');
    }
  }

  String get getText {
    if (state.text == null) {
      return 'No Text Found';
    }
    if (state.text == '') {
      return 'There is no text on the image.';
    }
    return state.text!;
  }

  Future<void> processImage() async {
    try {
      state = state.copyWith(isProcessing: true);
      if (state.inputImage != null) {
        final recognisedText = await _textDetector.processImage(
          state.inputImage!,
          script: reader(languageProvider),
        );
        state = state.copyWith(text: recognisedText.text);
      }
    } catch (e) {
      rethrow;
    } finally {
      state = state.copyWith(isProcessing: false);
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _textDetector.close();
  }
}
