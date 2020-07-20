import 'package:flutter/cupertino.dart';
import 'package:gateway/model/api_error_model.dart';

typedef OnSuccess<T> = void Function(T data);
typedef OnError = void Function(ApiError error);

class ApiCallback<T> {
  OnSuccess<T> onSuccess;
  OnError onError;

  ApiCallback({@required OnSuccess<T> onSuccess, @required OnError onError});
}
