import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../data/utils/interceptors.dart';
import '../../flavors.dart';
import 'app_module.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => $initGetIt(serviceLocator);

@module
@Singleton()
abstract class AppModule {
  @Singleton()
  Dio get dio {
    var interceptors = [
      AuthInterceptor(),
      ErrorInterceptor(),
    ];
    return _createDio(interceptors, FlavorConfig.baseUrl);
  }

  Dio _createDio(List<Interceptor> interceptors, String url) {
    final BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 30),
      baseUrl: url,

      /// Dio defaults to json parsing, specify it here to return UTF8 string and handle it yourself.
      /// (It can also be achieved through a custom transformer)
      responseType: ResponseType.plain,
      validateStatus: (_) {
        /// Do not use http status code to judge the status, use AdapterInterceptor to handle (applicable to standard REST style)
        return true;
      },
    );

    final dio = Dio(options);
    for (var interceptor in interceptors) {
      dio.interceptors.add(interceptor);
    }

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));
    }

    return dio;
  }
}
