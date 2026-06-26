import 'package:flutter/material.dart';
import 'package:shopease/models/order_tracking_step.dart';

class OrderTrackingCaardWidget extends StatelessWidget {
  final String orderId;
  final String dateLabel;
  final String date;
  final String status;

  const OrderTrackingCaardWidget({
    super.key,
    required this.orderId,
    required this.dateLabel,
    required this.date,
    required this.status,
  });

  Color _statusColor() {
    switch (status) {
      case "Delivered":
        return Colors.green;

      case "Out for Delivery":
        return Colors.orange;

      case "In Transit":
        return const Color(0xFF7B2CF5);

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFD6C4FF),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order ID",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                Text(
                  orderId,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "$dateLabel $date",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: _statusColor(),
              borderRadius:
                  BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//tracking
class OrderTrackingTimeline extends StatelessWidget {
  final List<OrderTrackingStep> steps;

  const OrderTrackingTimeline({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: List.generate(
          steps.length,
          (index) {
            final step = steps[index];
            final isLast =
                index == steps.length - 1;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: step.isCompleted
                              ? Colors.green
                              : step.isCurrent
                                  ? const Color(
                                      0xFF7B2CF5,
                                    )
                                  : Colors.white,
                          border: Border.all(
                            color: step.isCompleted
                                ? Colors.green
                                : step.isCurrent
                                    ? const Color(
                                        0xFF7B2CF5,
                                      )
                                    : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: step.isCompleted
                            ? const Icon(
                                Icons.check,
                                color:Colors.white,
                                size: 14,
                              )
                            : null,
                      ),

                      if (!isLast)
                        Expanded(
                          child: Container(
                            width: 2,
                            color: step.isCompleted
                                ? Colors.green
                                : Colors.grey.shade300,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            step.title,
                            style:const TextStyle(
                              fontSize: 18,
                              fontWeight:FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                              height: 4),
                          Text(
                            step.description,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                              height: 4),
                          Text(
                            step.dateTime,
                            style: const TextStyle(
                              color:Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}