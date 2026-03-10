import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:test_app1/data/api/api_service.dart';
import 'package:test_app1/data/repositories/order_repository.dart';
import 'package:test_app1/data/repositories/order_repository_impl.dart';

class DependencyInjection {
  static void init() {
    // 1. Регистрируем Dio (один экземпляр на всё приложение)
    Get.lazyPut(
      () => Dio(
        BaseOptions(
          baseUrl: dotenv.env['API_BASE_URL'] ?? 'https://example.com',
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      ),
    );

    Get.lazyPut<OrderRepository>(
      () => OrderRepositoryImpl(apiService: ApiService(dio: Get.find<Dio>())),
    );
  }
}
