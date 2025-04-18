import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synapsis/core/app/app_config.dart';
import 'package:synapsis/domain/model/response_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../presentations/component/component.dart';
import 'env_service.dart';

class DioService extends getx.GetxService {
  late PersistCookieJar cookieJar;
  late Dio dio;

  Future<DioService> init() async {
    dio = await setupDio();
    return this;
  }

  Future<Dio> setupDio() async {
    return await checkConnectivity().then((value) async {
      if (value) {
        final Dio dio = new Dio();
        Map<String, dynamic> headers = {};
        headers = {
          'Cache-Control': AppConfig.cacheControl,
          'Content-Type': AppConfig.contentType,
        };
        dio.options = BaseOptions(
          baseUrl: EnvService.baseURL(),
          headers: headers,
        );
        if (kDebugMode) {
          dio.interceptors.add(
            PrettyDioLogger(
              error: EnvService.debug,
              request: EnvService.debug,
              requestBody: EnvService.debug,
              requestHeader: EnvService.debug,
              responseBody: EnvService.debug,
              responseHeader: EnvService.debug,
              compact: EnvService.debug,
            ),
          );
        }
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: onRequest,
            onResponse: onResponse,
            onError: onError,
          ),
        );
        final dir = await getApplicationDocumentsDirectory();
        cookieJar = PersistCookieJar(
          storage: FileStorage('${dir.path}/.cookies/'),
        );

        dio.interceptors.add(CookieManager(cookieJar));
        return dio;
      } else {
        Component.toast("No Internet", snackType: SnackType.error);
        return Future.error("No Internet");
      }
    });
  }

  Future<bool> checkConnectivity() async {
    bool connect = false;
    try {
      final result = await InternetAddress.lookup('google.com').timeout(AppConfig.timeRequestApi);
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        connect = true;
      }
    } on SocketException catch (_) {
      connect = false;
    }
    return connect;
  }

  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  Future<void> onResponse(Response? response, handler) async {
    ResponseApi responseApi = ResponseApi.fromJson(response?.data);
    response?.data = responseApi;
    handler.next(response!);
  }

  Future<void> onError(DioException dioError, ErrorInterceptorHandler handler) async {
    if (dioError.type == DioExceptionType.connectionTimeout || dioError.type == DioExceptionType.receiveTimeout || dioError.type == DioExceptionType.sendTimeout) {
      Component.toast("Request Time Out");
    } else if (dioError.type == DioExceptionType.unknown) {
      Component.toast("Tidak dapat terhubung");
      return handler.next(dioError);
    } else if (dioError.type == DioExceptionType.badResponse) {
      return handler.next(dioError);
    } else {
      Component.toast("Terjadi kesalahan", snackType: SnackType.error);
      throw dioError.message ?? dioError.error.toString();
    }
  }

  Future<ResponseApi> post({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    var response = await dio.post(url, data: body);
    return response.data;
  }

  Future<ResponseApi> put({required String url, Map<String, dynamic>? body}) async {
    var response = await dio.put(url, data: body);
    return response.data;
  }

  Future<bool> delete({required String url, Map<String, dynamic>? body}) async {
    var response = await dio.delete(
      url,
      data: body,
    );
    return (response.statusCode ?? 500) < 300;
  }

  Future<ResponseApi> get({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    ResponseApi responseApi = ResponseApi();
    try {
      var response = await dio.get(url, queryParameters: body);
      responseApi = response.data;
    } catch (e) {
      responseApi = ResponseApi();
    }
    return responseApi;
  }

  // Get saved cookies for a URL
  Future<List<Cookie>> getCookies(String url) async {
    return await cookieJar.loadForRequest(Uri.parse(url));
  }
}
