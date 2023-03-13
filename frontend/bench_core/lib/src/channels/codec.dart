import 'package:bench_core/messages.dart';
import 'package:bench_core/src/messages/actions.dart';
import 'dart:convert';

abstract class StringCodec<T> {
  String encode(T value);
  T decode(String s);
}

abstract class ObjectCodec<T> {
  Object? encode(T value) {
    return value;
  }

  T decodeImpl(Object s);
  T decode(Object? s) {
    if (s == null) {
      return defaultValue;
    } else {
      return decodeImpl(s);
    }
  }

  T get defaultValue;
}

class MissingCodec implements Exception {
  String message;
  MissingCodec(this.message);
}

class DecodingFailure implements Exception {
  String message;
  DecodingFailure(Type from, Type to)
      : message = "failed to convert from $from to $to";
}

class ObjectCodecRegistry {
  static ObjectCodec<T> getCodec<T>() {
    if (T == double) {
      return FloatObjectCodec() as ObjectCodec<T>;
    } else {
      throw MissingCodec(T.runtimeType.toString());
    }
  }
}

class FloatObjectCodec extends ObjectCodec<double> {
  @override
  double decodeImpl(Object s) {
    if (s is double) {
      return s;
    } else {
      throw DecodingFailure(s.runtimeType, double);
    }
  }

  @override
  double get defaultValue => double.nan;
}

class FloatStringCodec extends StringCodec<double> {
  @override
  double decode(String s) {
    return double.parse(s);
  }

  @override
  String encode(double value) {
    return value.toString();
  }
}

class BoolStringCodec extends StringCodec<bool> {
  @override
  bool decode(String s) {
    return s == "true"
        ? true
        : s == "false"
            ? false
            : throw DecodingFailure(String, bool);
  }

  @override
  String encode(bool value) {
    return value.toString();
  }
}

class StringCodecRegistry {
  static StringCodec<T> getCodec<T>() {
    if (T == double) {
      return FloatStringCodec() as StringCodec<T>;
    } else if (T == bool) {
      return BoolStringCodec() as StringCodec<T>;
    } else if (T == SetValueAction<double>) {
      return SetValueAction.codec<double>() as StringCodec<T>;
    } else if (T == SetPointAction) {
      return SetPointAction.codec as StringCodec<T>;
    } else {
      throw MissingCodec(T.runtimeType.toString());
    }
  }
}
