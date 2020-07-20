import 'package:gateway/gateway.dart';

class ApiResult<T> {
  T data;

  ApiError error;

  bool _isSuccessful;

  ApiResult({this.data, this.error}) {
    _isSuccessful = this.data != null;
  }

  bool get isSuccessful => _isSuccessful;
}
