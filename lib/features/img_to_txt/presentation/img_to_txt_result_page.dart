import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/controller.dart';

class ImgToTxtResultPage extends StatelessWidget {
  const ImgToTxtResultPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/img_to_txt_result_page';
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final text =
            ref.watch(imgToTxtModelProvider.select((value) => value.text));
        return Scaffold(
          appBar: AppBar(
            title: const Text('Hello there'),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableText(
                  ref.read(imgToTxtModelProvider.notifier).getText,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: text));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All Text Copied to clipboard'),
                ),
              );
            },
            tooltip: 'Copy all text',
            label: const Text('Copy to Clipboard'),
            icon: const Icon(Icons.content_copy),
          ),
        );
      },
    );
  }
}
