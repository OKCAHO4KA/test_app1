import 'package:test_app1/data/models/order.dart';

abstract class OrderRepository {
  Future<Order> createOrder(int userId, int serviceId);
}
