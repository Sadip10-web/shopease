import 'package:flutter/material.dart';
import 'package:shopease/models/order_tracking_step.dart';
import 'package:shopease/widgets/custom_top_bar.dart';
import 'package:shopease/widgets/order_tracking_caard_widget.dart';


class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(
        title: "Order Tracking",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderTrackingCaardWidget(
              orderId: "213732676987",
              dateLabel: "Delivered On",
              date: "27 Oct 2025, 11:22 AM",
              status: "Delivered",
            ),

            const SizedBox(height: 20),

            OrderTrackingTimeline(
              steps: const [
                OrderTrackingStep(
                  title: "Delivered",
                  description:
                      "Your order has been delivered successfully.",
                  dateTime:
                      "27 Oct, 2025 at 11:22 AM",
                  isCurrent: true,
                ),

                OrderTrackingStep(
                  title: "Out for Delivery",
                  description:
                      "Your order is out for delivery.",
                  dateTime:
                      "27 Oct, 2025 at 09:30 AM",
                  isCompleted: true,
                ),

                OrderTrackingStep(
                  title: "In Transit",
                  description:
                      "Your order is on the way.",
                  dateTime:
                      "26 Oct, 2025 at 05:15 PM",
                  isCompleted: true,
                ),

                OrderTrackingStep(
                  title: "Ready to Ship",
                  description:
                      "Your package is packed and ready.",
                  dateTime:
                      "26 Oct, 2025 at 10:00 AM",
                  isCompleted: true,
                ),

                OrderTrackingStep(
                  title: "Confirmed",
                  description:
                      "Your order has been confirmed.",
                  dateTime:
                      "25 Oct, 2025 at 03:00 PM",
                  isCompleted: true,
                ),

                OrderTrackingStep(
                  title: "Order Placed",
                  description:
                      "You placed your order.",
                  dateTime:
                      "25 Oct, 2025 at 01:20 PM",
                  isCompleted: true,
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}