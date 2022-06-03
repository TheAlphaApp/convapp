import 'package:convapp/features/img_to_txt/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'img_to_txt_result_page.dart';

class ImgToTxtPage extends StatelessWidget {
  const ImgToTxtPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/img_to_txt_page';
  @override
  Widget build(BuildContext context) {
    print('Building ImgToTxtPage');
    return Consumer(
      builder: (context, ref, _) {
        final model = ref.watch(imgToTxtModelProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text('ConvApp'),
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              if (model.image != null && model.inputImage != null) ...[
                SizedBox(
                  height: 400,
                  width: 400,
                  child: model.isProcessing
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.file(model.image!),
                          ],
                        ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: model.isProcessing
                      ? null
                      : Center(
                          child: DropdownButton<TextRecognitionScript>(
                            // When the sort type changes, this will rebuild the dropdown
                            // to update the icon shown.
                            value: ref.watch(languageProvider),
                            // When the user interacts with the dropdown, we update the provider state.
                            onChanged: (value) => ref
                                .read(languageProvider.notifier)
                                .state = value!,
                            items: const [
                              DropdownMenuItem(
                                value: TextRecognitionScript.latin,
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: TextRecognitionScript.devanagiri,
                                child: Text('Hindi'),
                              ),
                              DropdownMenuItem(
                                value: TextRecognitionScript.chinese,
                                child: Text('Chinese'),
                              ),
                              DropdownMenuItem(
                                value: TextRecognitionScript.japanese,
                                child: Text('Japanese'),
                              ),
                              DropdownMenuItem(
                                value: TextRecognitionScript.korean,
                                child: Text('Korean'),
                              ),
                            ],
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: model.isProcessing
                      ? const Center(
                          child: Text(
                            'Processing...',
                            style: TextStyle(fontSize: 24),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            ref
                                .read(imgToTxtModelProvider.notifier)
                                .processImage()
                                .then(
                                  (value) => Navigator.restorablePushNamed(
                                      context, ImgToTxtResultPage.routeName),
                                );
                          },
                          child: const Text('SCAN'),
                        ),
                ),
              ],
              if (model.image == null)
                const Icon(
                  Icons.image,
                  size: 200,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: model.isProcessing
                    ? null
                    : ElevatedButton(
                        child: const Text('From Gallery'),
                        onPressed: () => ref
                            .read(imgToTxtModelProvider.notifier)
                            .getImage(ImageSource.gallery),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: model.isProcessing
                    ? null
                    : ElevatedButton(
                        child: const Text('Take a picture'),
                        onPressed: () => ref
                            .read(imgToTxtModelProvider.notifier)
                            .getImage(ImageSource.camera),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
