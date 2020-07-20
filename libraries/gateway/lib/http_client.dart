part of 'gateway.dart';

final _gatewayHttpClient = _GatewayHttpClient();

final httpClient = _gatewayHttpClient;

class _GatewayHttpClient {
  static final _localProxyIPAddress = "192.168.13.65";
  static final _localProxyPort = "8888";

  Dio dio;

  _GatewayHttpClient() {
    dio = Dio(_options());
    setProxy();
  }

  BaseOptions _options() => BaseOptions(
        baseUrl: "https://frodo.douban.com",
        connectTimeout: 10000,
        receiveTimeout: 15000,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
        headers: {
          HttpHeaders.userAgentHeader:
              'api-client/1 com.douban.frodo/6.38.0(188) Android/25 product/OnePlus3 vendor/OnePlus model/ONEPLUS A3010  rom/android  network/wifi  platform/mobile'
        },
        queryParameters: {
          'sugar': '46011',
          'apikey': '0dad551ec0f84ed02907ff5c42e8ec70',
          'os_rom': DeviceInfo.operatingSystem(),
          'udid': '9888150d66bbc8b412489da586e4330a58f9bcc6',
          '_sig': 'lDx5rufQh2Q7ZmynpLAj2R13n0Q=',
          '_ts': '1593747977',
          'apple': 'b93d55cf703d48f08980450becbb0a3a',
          'icecream': '74d7a6682a1d74d5f780c7bd8a1e4819',
          'mooncake': '0f607264fc6318a92b9e13c65db7cd3c',
          'webview_ua':
              'Mozilla/5.0 (Linux; Android 7.1.1; ONEPLUS A3010 Build/NMF26F; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/83.0.4103.106 Mobile Safari/537.36',
        },
      );

  void setProxy() {
    var adapter = dio.httpClientAdapter as DefaultHttpClientAdapter;
    adapter.onHttpClientCreate = (client) {
      // 设置该客户端的代理为指定的 ip:端口
      // 安卓机上面证书授权:
      client.findProxy = (uri) {
        return 'PROXY $_localProxyIPAddress:$_localProxyPort';
      };
      client.badCertificateCallback = (cert, host, port) => true;
    };
  }

  Future<ApiResult<T>> get<T>(
    String path,
    T jsonAdapt(String json), {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    return await _request(
      'GET',
      path,
      jsonAdapt,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<ApiResult<T>> post<T>(
    String path,
    T jsonAdapt(String json), {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    return await _request(
      'POST',
      path,
      jsonAdapt,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<ApiResult<T>> put<T>(
    String path,
    T jsonAdapt(String json), {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    return await _request(
      'PUT',
      path,
      jsonAdapt,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<ApiResult<T>> delete<T>(
    String path,
    T jsonAdapt(String json), {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    return await _request(
      'DELETE',
      path,
      jsonAdapt,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<ApiResult<T>> _request<T>(
    String method,
    String path,
    // json适配
    T jsonAdapt(String json), {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    // 检查网络连接
    final isOnline = await NetworkUtil.isOnline();
    if (!isOnline) {
      return ApiResult(
        error: ApiError(msg: '网络未连接', localizedMessage: '网络未连接', code: -1, request: '$method: $path'),
      );
    }

    // 定义请求方法
    if (options == null) {
      options = Options();
    }
    options.method = method;

    try {
      final response = await dio.request(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // 成功
      if (response.statusCode == HttpStatus.ok) {
        final data = jsonAdapt(response.data);
        return ApiResult(data: data);
      } else {
        // 失败
        final error = apiErrorFromJson(response.data);
        return ApiResult(error: error);
      }
    } on DioError catch (e, stack) {
      // Dio error
      return ApiResult(
        error: ApiError(
            msg: e.error.toString(),
            localizedMessage: e.message,
            code: -1,
            request: '$method: $path'),
      );
    } on Exception catch (e) {
      // 其他错误
      return ApiResult(
        error: ApiError(msg: e.toString(), localizedMessage: e.toString(), code: -1, request: '$method: $path'),
      );
    }
  }
}
