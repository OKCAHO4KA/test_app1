import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_app1/app/providers/create_order_controller.dart';
import 'package:test_app1/data/api/api_service.dart';
import 'package:test_app1/data/repositories/order_repository.dart';
import 'package:test_app1/data/repositories/order_repository_impl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(BaseOptions(baseUrl: '...')));
    Get.lazyPut<OrderRepository>(
      () => OrderRepositoryImpl(apiService: ApiService(dio: Get.find<Dio>())),
    );
    // Сюда же можно добавить контроллер, если он нужен везде
    Get.lazyPut(() => OrderController(repository: Get.find()));
  }
}
