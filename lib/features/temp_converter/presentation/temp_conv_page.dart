import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/temp_conv_controller.dart';

class TempConvPage extends StatelessWidget {
  const TempConvPage({Key? key}) : super(key: key);
  static const String routeName = 'temp_conv_page';
  @override
  Widget build(BuildContext context) {
    print('building.......');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Temperature Converter'),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter temperature',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  ref.read(valueProvider.state).update(
                        (state) => state = double.tryParse(value),
                      );
                },
              ),
              SizedBox(
                width: 200,
                height: 150,
                child: CupertinoPicker(
                  itemExtent: 40,
                  looping: true,
                  onSelectedItemChanged: (index) {
                    ref
                        .read(toProvider.state)
                        .update((state) => Temperature.values[index]);
                  },
                  children: Temperature.values.map((e) {
                    return Center(
                      child: Text(
                          e.toString().split('.').last.capitalizeFirstLetter()),
                    );
                  }).toList(),
                ),
              ),
              Text(
                ref.watch(temperatureResultProvider) == null
                    ? 'Hello'
                    : ref.watch(temperatureResultProvider)!.toStringAsFixed(2),
              ),
              SizedBox(
                width: 200,
                height: 150,
                child: CupertinoPicker(
                  itemExtent: 40,
                  looping: true,
                  onSelectedItemChanged: (index) {
                    ref
                        .read(fromProvider.state)
                        .update((state) => Temperature.values[index]);
                  },
                  children: Temperature.values.map((e) {
                    return Center(
                      child: Text(
                          e.toString().split('.').last.capitalizeFirstLetter()),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
