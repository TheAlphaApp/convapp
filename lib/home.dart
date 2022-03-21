import 'package:convapp/temp_files/labeling/label_detector.dart';
import 'package:convapp/temp_files/object%20detector/object_detector.dart';
import 'package:flutter/material.dart';

import 'features/img_to_txt/presentation/img_to_txt_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convapp'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Image to Text'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, ImgToTxtPage.routeName);
            },
          ),
          ListTile(
            title: const Text('Image Labelling'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, ImageLabelView.routeName);
            },
          ),
          ListTile(
            title: const Text('Object Detector View'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, ObjectDetectorView.routeName);
            },
          )
        ],
      ),
    );
  }
}
