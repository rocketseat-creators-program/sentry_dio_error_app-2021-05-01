import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ApiService {
  final Dio _dio = Dio();

  Dio get client {
    _dio.interceptors.clear();

    _dio.options.baseUrl = 'https://5f81ae580695720016432d12.mockapi.io';
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // O que voce quer configurar antes de enviar a request

        // Token
        // final token = 's54df4asd5f4as5df4as5df4asd5f4';
        // if (token.isNotEmpty) {
        //   options.headers["Authorization"] = "Bearer $token";
        // }

        // Change the content-type header when it is FormData
        if (options.data is FormData) {
          options.contentType = "multipart/form-data; charset=utf-8";
        }

        // Whether this function returns true all requests
        // are considered successfull
        options.validateStatus = (int? status) {
          return status != null && status >= 200 && status < 300;
        };

        var request = '\n\n===================> REQUEST\n';
        request += 'URL: ${options.uri.toString()}\n';
        request += 'METHOD: ${options.method}\n';
        // Voce pode adicionar mais opcoes aqui...
        request += '===================> END...\n\n';
        print(request);

        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (e, handler) {
        Sentry.captureMessage(
          'Erro na API - ${e.response?.statusMessage} (${e.response?.statusCode})',
          level: SentryLevel.warning,
        );

        return handler.resolve(Response(
          requestOptions: e.requestOptions,
          // data: e.response?.data,
          statusCode: e.response?.statusCode,
          statusMessage: e.response?.statusMessage,
        ));
      },
    ));
    return _dio;
  }
}
