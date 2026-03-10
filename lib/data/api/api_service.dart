import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  Future<Response> createOrder(int userId, int serviceId) async {
    return await dio.post(
      '/api/orders',
      data: {'user_id': userId, 'service_id': serviceId},
    );
  }
}
