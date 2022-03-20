// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'img_to_txt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImgToTxtModelTearOff {
  const _$ImgToTxtModelTearOff();

  _ImgToTxtModel call(
      {String? text,
      File? image,
      dynamic isProcessing = false,
      InputImage? inputImage}) {
    return _ImgToTxtModel(
      text: text,
      image: image,
      isProcessing: isProcessing,
      inputImage: inputImage,
    );
  }
}

/// @nodoc
const $ImgToTxtModel = _$ImgToTxtModelTearOff();

/// @nodoc
mixin _$ImgToTxtModel {
  String? get text => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  dynamic get isProcessing => throw _privateConstructorUsedError;
  InputImage? get inputImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImgToTxtModelCopyWith<ImgToTxtModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImgToTxtModelCopyWith<$Res> {
  factory $ImgToTxtModelCopyWith(
          ImgToTxtModel value, $Res Function(ImgToTxtModel) then) =
      _$ImgToTxtModelCopyWithImpl<$Res>;
  $Res call(
      {String? text,
      File? image,
      dynamic isProcessing,
      InputImage? inputImage});
}

/// @nodoc
class _$ImgToTxtModelCopyWithImpl<$Res>
    implements $ImgToTxtModelCopyWith<$Res> {
  _$ImgToTxtModelCopyWithImpl(this._value, this._then);

  final ImgToTxtModel _value;
  // ignore: unused_field
  final $Res Function(ImgToTxtModel) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? image = freezed,
    Object? isProcessing = freezed,
    Object? inputImage = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      isProcessing: isProcessing == freezed
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as dynamic,
      inputImage: inputImage == freezed
          ? _value.inputImage
          : inputImage // ignore: cast_nullable_to_non_nullable
              as InputImage?,
    ));
  }
}

/// @nodoc
abstract class _$ImgToTxtModelCopyWith<$Res>
    implements $ImgToTxtModelCopyWith<$Res> {
  factory _$ImgToTxtModelCopyWith(
          _ImgToTxtModel value, $Res Function(_ImgToTxtModel) then) =
      __$ImgToTxtModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? text,
      File? image,
      dynamic isProcessing,
      InputImage? inputImage});
}

/// @nodoc
class __$ImgToTxtModelCopyWithImpl<$Res>
    extends _$ImgToTxtModelCopyWithImpl<$Res>
    implements _$ImgToTxtModelCopyWith<$Res> {
  __$ImgToTxtModelCopyWithImpl(
      _ImgToTxtModel _value, $Res Function(_ImgToTxtModel) _then)
      : super(_value, (v) => _then(v as _ImgToTxtModel));

  @override
  _ImgToTxtModel get _value => super._value as _ImgToTxtModel;

  @override
  $Res call({
    Object? text = freezed,
    Object? image = freezed,
    Object? isProcessing = freezed,
    Object? inputImage = freezed,
  }) {
    return _then(_ImgToTxtModel(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      isProcessing:
          isProcessing == freezed ? _value.isProcessing : isProcessing,
      inputImage: inputImage == freezed
          ? _value.inputImage
          : inputImage // ignore: cast_nullable_to_non_nullable
              as InputImage?,
    ));
  }
}

/// @nodoc

class _$_ImgToTxtModel implements _ImgToTxtModel {
  const _$_ImgToTxtModel(
      {this.text, this.image, this.isProcessing = false, this.inputImage});

  @override
  final String? text;
  @override
  final File? image;
  @JsonKey()
  @override
  final dynamic isProcessing;
  @override
  final InputImage? inputImage;

  @override
  String toString() {
    return 'ImgToTxtModel(text: $text, image: $image, isProcessing: $isProcessing, inputImage: $inputImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImgToTxtModel &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.isProcessing, isProcessing) &&
            const DeepCollectionEquality()
                .equals(other.inputImage, inputImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(isProcessing),
      const DeepCollectionEquality().hash(inputImage));

  @JsonKey(ignore: true)
  @override
  _$ImgToTxtModelCopyWith<_ImgToTxtModel> get copyWith =>
      __$ImgToTxtModelCopyWithImpl<_ImgToTxtModel>(this, _$identity);
}

abstract class _ImgToTxtModel implements ImgToTxtModel {
  const factory _ImgToTxtModel(
      {String? text,
      File? image,
      dynamic isProcessing,
      InputImage? inputImage}) = _$_ImgToTxtModel;

  @override
  String? get text;
  @override
  File? get image;
  @override
  dynamic get isProcessing;
  @override
  InputImage? get inputImage;
  @override
  @JsonKey(ignore: true)
  _$ImgToTxtModelCopyWith<_ImgToTxtModel> get copyWith =>
      throw _privateConstructorUsedError;
}
