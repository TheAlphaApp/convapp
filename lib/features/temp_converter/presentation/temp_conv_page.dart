import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Temperature {
  celsius,
  fahrenheit,
  kelvin,
}

class TempConvPage extends StatefulWidget {
  const TempConvPage({Key? key}) : super(key: key);

  @override
  State<TempConvPage> createState() => _TempConvPageState();
}

class _TempConvPageState extends State<TempConvPage> {
  double? _value;
  double? _result;
  // final _controller = TextEditingController();
  Temperature _from = Temperature.celsius;
  Temperature _to = Temperature.fahrenheit;
  double _min = -273.15;

  double? _convertTemp(double? value, Temperature from, Temperature to) {
    if (value == null) {
      return null;
    }
    if (from == to) {
      return value;
    }
    switch (from) {
      case Temperature.celsius:
        switch (to) {
          case Temperature.fahrenheit:
            return value * 1.8 + 32;
          case Temperature.kelvin:
            return value + 273.15;
          case Temperature.celsius:
            return value;
        }
      case Temperature.fahrenheit:
        switch (to) {
          case Temperature.celsius:
            return (value - 32) / 1.8;
          case Temperature.kelvin:
            return (value + 459.67) * 5 / 9;
          case Temperature.fahrenheit:
            return value;
        }
      case Temperature.kelvin:
        switch (to) {
          case Temperature.celsius:
            return value - 273.15;
          case Temperature.fahrenheit:
            return value * 9 / 5 - 459.67;
          case Temperature.kelvin:
            return value;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Temperature Converter'),
          TextField(
            // controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter temperature',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _value = double.tryParse(value) ?? 0;
                _result = _convertTemp(_value, _from, _to);
              });
            },
          ),
          SizedBox(
            width: 200,
            height: 150,
            child: CupertinoPicker(
              itemExtent: 40,
              looping: true,
              onSelectedItemChanged: (index) {
                setState(() {
                  _from = Temperature.values[index];
                  _result = _convertTemp(_value, _from, _to);
                });
              },
              children: Temperature.values.map((e) {
                return Center(
                  child: Text(
                      e.toString().split('.').last.capitalizeFirstLetter()),
                );
              }).toList(),
            ),
          ),
          Text('Result: ${_result?.toStringAsFixed(2) ?? ''}'),
          SizedBox(
            width: 200,
            height: 150,
            child: CupertinoPicker(
              itemExtent: 40,
              looping: true,
              onSelectedItemChanged: (index) {
                setState(() {
                  _to = Temperature.values[index];
                  _result = _convertTemp(_value, _from, _to);
                });
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
      ),
    );
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
