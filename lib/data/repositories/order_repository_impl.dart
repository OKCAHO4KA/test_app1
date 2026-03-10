import 'package:dio/dio.dart';
import 'package:test_app1/config/resources/api_exception.dart';
import 'package:test_app1/data/api/api_service.dart';
import 'package:test_app1/data/models/order.dart';
import 'package:test_app1/data/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ApiService apiService;
  OrderRepositoryImpl({required this.apiService});

  @override
  Future<Order> createOrder(int userId, int serviceId) async {
    try {
      final response = await apiService.createOrder(userId, serviceId);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Order.fromJson(response.data);
      } else {
        throw ApiException(
          message: '${response.statusMessage}',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? 'Ошибка сети',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException(message: 'Непредвиденная ошибка: $e');
    }
  }
}
