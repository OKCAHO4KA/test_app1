import 'package:get/get.dart';
import 'package:test_app1/data/models/order.dart';
import 'package:test_app1/data/repositories/order_repository.dart';

class OrderController extends GetxController {
  final OrderRepository repository;
  OrderController({required this.repository});

  // Состояния (реактивные переменные)
  var isLoading = false.obs;
  var orderData = Rxn<Order>(); // Nullable Order

  Future<void> createOrder(int userId, int serviceId) async {
    try {
      isLoading.value = true;
      final result = await repository.createOrder(userId, serviceId);
      orderData.value = result;
      Get.snackbar('Успех', 'Заказ создан');
    } catch (e) {
      Get.snackbar('Ошибка', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
