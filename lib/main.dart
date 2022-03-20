import 'package:camera/camera.dart';
import 'package:convapp/features/img_to_txt/presentation/img_to_txt_result_page.dart';
import 'package:convapp/painters/camera_view.dart';
import 'package:convapp/painters/text_detector_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/img_to_txt/presentation/img_to_txt_page.dart';
import 'home.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convapp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ImgToTxtPage.routeName: (context) => const ImgToTxtPage(),
        ImgToTxtResultPage.routeName: (context) => const ImgToTxtResultPage(),
      },
    );
  }
}
