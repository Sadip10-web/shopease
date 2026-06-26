import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/order_details_view.dart';
import 'package:shopease/widgets/custom_top_bar.dart';
import 'package:shopease/widgets/order_card_widget.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}
class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: CustomTopBar(
    title: "Order History",
    actions: [
      IconButton(
        icon: const Icon(Icons.search, color: Colors.black),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.shopping_cart_outlined,       //shoping cart
            color: Colors.black),
        onPressed: () {},
        
      ),
    ],
  ),
  body: SafeArea(
  child: DefaultTabController(
    length: 7,
    child: Column(
      children: [
        const SizedBox(height: 8),
        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF8B5CF6),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search by Order ID or Product",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4EEFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xFF8B5CF6),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
          TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          indicatorColor: Color(0xFF7B2CF5),
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Color(0xFF7B2CF5),
          unselectedLabelColor: Colors.black87,
          tabs: const [
            Tab(text: 'All Orders'),
            Tab(text: 'To Pay'),
            Tab(text: 'Processing'),
            Tab(text: 'To Ship'),
            Tab(text: 'To Receive'),
            Tab(text: 'Return/Refund'),
            Tab(text: 'To Review'),
          ],
        ),  
        Expanded(
          child: TabBarView(
            children: [
              // ALL ORDERS
      ListView(
        children: [
          OrderCard(
            shopName: "Kathmandu Shop",
            productName: "Nike Air Max",
            color: "White Orange",
            price: "Rs. 3000",
            total: "Rs. 3120",
            quantity: "1",
            status: "Completed",
            imagePath: "https://www.bing.com/th/id/OIP.tJQjxbLRRaEt9B4OB546kAHaHw?w=193&h=202&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",            
           onTap: () {
    Get.to(() => const OrderDetailsView(
    ));
  },               
            ),
            OrderCard(
            shopName: "Nepal Store",
            productName: "Womens Handbag",
            color: "White Orange",
            price: " 10000",
            total: "Rs.20150",
            quantity: "2",
            status: "Processing",
            imagePath: "https://i5.walmartimages.com/seo/TAIAOJING-Womens-Handbags-Casual-Leather-Messenger-Bag-Large-Capacity-Handbag-Fashion-Bag_317c7ab0-780c-4476-baf2-aceaff2b65a3.2cbbebf7c4c0b06e46f83dc08f5e7253.jpeg",            
            ),
        ],
      ),
      // TO PAY
      Center(child: Text("No orders yet")),
      // PROCESSING
     ListView(
        children: [
          OrderCard(
            shopName: "Nepal Store",
            productName: "Womens Handbag",
            color: "White Orange",
            price: " 10000",
            total: "Rs.20150",
            quantity: "2",
            status: "Processing",
            imagePath: "https://i5.walmartimages.com/seo/TAIAOJING-Womens-Handbags-Casual-Leather-Messenger-Bag-Large-Capacity-Handbag-Fashion-Bag_317c7ab0-780c-4476-baf2-aceaff2b65a3.2cbbebf7c4c0b06e46f83dc08f5e7253.jpeg",              
            ),
        ],
     ),
       
      // To ship
      Center(child: Text("No orders yet")), 

      // TO RECEIVE
      Center(child: Text("No orders yet")),

      // RETURN / REFUND
      Center(child: Text("No orders yet")),

      // TO REVIEW
      Center(child: Text("No orders yet")),
    ],
  ),
)
      ],
    ),
  ),
  ),
    );
     
    
  }
}

