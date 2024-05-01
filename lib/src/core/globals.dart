import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'networking/interceptors/refresh_token_interceptor.dart';
import '../utils/path_provider_service.dart';

import 'networking/api_endpoint.dart';
import 'networking/api_service.dart';
import 'networking/dio_service.dart';
import 'networking/interceptors/api_interceptor.dart';
import 'networking/interceptors/logging_interceptor.dart';

class Configs {
  const Configs._();

  static const baseUrl = 'https://derman.com.tm/dermanhana/webq/api';
}

class ApiServices {
  const ApiServices._();

  static const _cache = ApiServices._();

  factory ApiServices() => _cache;

  static final _baseOptions = BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
  );

  static final _dio = Dio(_baseOptions);

  static final _cacheOptions = CacheOptions(
    store: HiveCacheStore(PathProviderService.path),
    policy: CachePolicy.noCache, // Bcz we force cache on-demand in repositories
    maxStale: const Duration(days: 30), // No of days cache is valid
    keyBuilder: (options) => options.path,
  );

  static final _dioService = DioService(
    dioClient: _dio,
    globalCacheOptions: _cacheOptions,
    interceptors: [
      ApiInterceptor(),
      DioCacheInterceptor(options: _cacheOptions),
      if (kDebugMode) LoggingInterceptor(),
      RefreshTokenInterceptor(dioClient: _dio),
    ],
  );
  static final apiService = ApiService(_dioService);
}
