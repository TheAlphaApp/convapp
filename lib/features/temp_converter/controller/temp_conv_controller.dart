
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Temperature {
  celsius,
  fahrenheit,
  kelvin,
}
final toProvider = StateProvider<Temperature>((ref) {
  return Temperature.celsius;
});

final fromProvider = StateProvider<Temperature>((ref) {
  return Temperature.celsius;
});
final valueProvider = StateProvider<double?>((ref) {
  return null;
});
final temperatureResultProvider = Provider<double?>((ref) {
  final _to = ref.watch(toProvider);
  final _from = ref.watch(fromProvider);
  final _value = ref.watch(valueProvider);
  if (_value == null) {
    return null;
  }
  if (_from == _to) {
    return _value;
  }
  switch (_from) {
    case Temperature.celsius:
      switch (_to) {
        case Temperature.fahrenheit:
          return _value * 1.8 + 32;
        case Temperature.kelvin:
          return _value + 273.15;
        case Temperature.celsius:
          return _value;
      }
    case Temperature.fahrenheit:
      switch (_to) {
        case Temperature.celsius:
          return (_value - 32) / 1.8;
        case Temperature.kelvin:
          return (_value + 459.67) * 5 / 9;
        case Temperature.fahrenheit:
          return _value;
      }
    case Temperature.kelvin:
      switch (_to) {
        case Temperature.celsius:
          return _value - 273.15;
        case Temperature.fahrenheit:
          return _value * 9 / 5 - 459.67;
        case Temperature.kelvin:
          return _value;
      }
  }
});

