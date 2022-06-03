import 'dart:io';

import 'package:convapp/features/img_to_txt/models/img_to_txt_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

final languageProvider = StateProvider<TextRecognitionScript>((ref) {
  return TextRecognitionScript.latin;
});
final imgToTxtModelProvider =
    StateNotifierProvider.autoDispose<ImgToTxtNotifier, ImgToTxtModel>(
  (ref) {
    final TextRecognizer _textRecognizer = GoogleMlKit.vision.textRecognizer(
      script: ref.read(languageProvider),
    );
    return ImgToTxtNotifier(
      _textRecognizer,
      imagePicker: ImagePicker(),
    );
  },
);

class ImgToTxtNotifier extends StateNotifier<ImgToTxtModel> {
  ImgToTxtNotifier(this.textRecognizer, {required this.imagePicker})
      : super(const ImgToTxtModel());
  final ImagePicker? imagePicker;
  final TextRecognizer textRecognizer;

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await imagePicker?.pickImage(source: source);
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
        final recognisedText = await textRecognizer.processImage(
          state.inputImage!,
          //
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
    await textRecognizer.close();
  }
}
