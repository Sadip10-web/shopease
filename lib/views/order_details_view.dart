import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/order_tracking_view.dart';
import 'package:shopease/views/product_detail.dart';
import 'package:shopease/widgets/order_card_widget.dart';
import 'package:shopease/widgets/order_details_card_widget.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
     backgroundColor: Colors.white,
     appBar: AppBar(
     backgroundColor: Colors.white,
     surfaceTintColor: Colors.white,
     elevation: 0,
     centerTitle: true,

    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 28,
      ),
    ),
    title: const Text(
      "Order Details",
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ), 
  ),
      
       body: SingleChildScrollView(          //completed mss
        child: Column(
          children: [
            OrderDetailsCardWidget(
            status: "Completed",
            paymentMethod: "Paid by Cash on Delivery.",
              message:"Your Order has been delivered and received successfully.",
            ),
            OrderInfoCard(
             orderId: "213732676987",
             orderPlacedOn: "25 Oct 2025",
             deliveredOn: "27 Oct 2025",
            paymentMethod: "Cash on Delivery",
           ),
            DeliveryAddressCard(
            receiverName: "Snopiee",
            phoneNumber: "9856045832",
            address:
          "Khaltemasina Buspark Area, near Nepal Tourism Hotel Management College, PKR",
           onTap: () {},
    ),
    // Product Card Here
        OrderCardWidget(
         shopName: "Kathmandu Shop",
         productName: "Nike Sneakers",
         color: "White Orange",
         price: "Rs. 3000",
         total: "1",
         qty: "1",
         status: "Completed",
         image: "https://www.bing.com/th/id/OIP.tJQjxbLRRaEt9B4OB546kAHaHw?w=193&h=202&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
       
         leftButtonText: "Return/Refund",
         rightButtonText: "Review",

          onLeftTap: () {},
          onRightTap: () {},

        onTap: () {
          Get.to(() => ProductDetail());
        },
      ),
      //Product Details
      PriceDetailsCard(
      subtotalLabel: "Subtotal(1 item)",
       subtotalAmount: "Rs. 3000",
       shippingLabel: "Shipping Fee",
       shippingAmount: "Rs. 120",
        extraFeeLabel: "COD Handling Fee",
        extraFeeAmount: "Rs. 8",
        totalAmount: "Rs. 3128",
        ),
       OrderTrackingCard(
       trackingMessage:
      "27 Oct - Package delivered!",
      onTap: () {
       Get.to(
       () => const OrderTrackingView(),
     );
   },
 ),
          ],
        ),
      ),
      
    );
  }
}

 