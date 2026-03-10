import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  int orderId;
  String status;
  String? paymentUrl;

  Order({required this.orderId, required this.status, this.paymentUrl});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    status: json["status"],
    paymentUrl: json["payment_url"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "status": status,
    "payment_url": paymentUrl,
  };
}
