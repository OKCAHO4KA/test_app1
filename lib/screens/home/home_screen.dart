import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app1/app/common_widgets/default_button_widget.dart';
import 'package:test_app1/app/providers/create_order_controller.dart';
import 'package:test_app1/config/theme/ui_themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = UIThemes.of(context);
    final controller = Get.put(OrderController(repository: Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тестовое приложение',
          style: theme.getBold24DarkGreen(context),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => DefaultButtonWidget(
                title: 'Создать заказ',
                onTap: () {
                  controller.createOrder(1, 101);
                },
                errorMessage: controller.orderData.value != null
                    ? 'Заказ ID: ${controller.orderData.value?.orderId ?? 'N/A'}'
                    : 'Произошла ошибка',
                isLoading: controller.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
