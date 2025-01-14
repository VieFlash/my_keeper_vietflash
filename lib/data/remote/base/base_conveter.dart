import 'package:json_annotation/json_annotation.dart';

import '../../../config/log/log.dart';
import '../response/login_response.dart';

class BaseConverter<T> implements JsonConverter<T, dynamic> {
  const BaseConverter();

  @override
  T fromJson(dynamic json) {
    try {
      if ((json is bool)) return json as T;
      if ((json is int)) return json as T;
      return fromJsonAsT<T>(json);
    } catch (e) {
      Log.e('Unable to parse $json to ${T.runtimeType}\nMessage: $e');
    }
    return json as T;
  }

  @override
  dynamic toJson(T object) {
    try {
      return _getToJson(runtimeType, this);
    } catch (e) {
      Log.e('Unable to parse $object to ${T.runtimeType}\nMessage: $e');
    }
    return object;
  }

  // ignore: unused_element
  T _getFromJson(Type type, dynamic data, dynamic json) {
    switch (type) {}
    return data as T;
  }

  T _getToJson(Type type, dynamic data) {
    switch (type) {}
    return data as T;
  }

  // Go back to a single instance by type
  dynamic _fromJsonSingle(String type, dynamic data) {
    final json = data as Map<String, dynamic>;
    switch (type) {
    // Need switch case to parse json
      case 'LoginResponse':
      case 'LoginResponse?':
        return LoginResponse.fromJson(json);
      case 'dynamic':
        return data;
    }
    Log.e('Parse error: \nType:$type');
    return null;
  }

  // Empty list is returned by type
  List? _getListFromType(String type) {
    // switch (type) {
    //
    // }
    return null;
  }

  M fromJsonAsT<M>(dynamic json) {
    final String type = M.toString();
    if (json is List && type.contains('List<')) {
      final String itemType = type.substring(5, type.length - 2);
      final List? tempList = _getListFromType(itemType);
      for (var itemJson in json) {
        tempList?.add(
          _fromJsonSingle(type.substring(5, type.length - 2), itemJson),
        );
      }
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
