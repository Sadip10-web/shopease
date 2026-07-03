import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/cartScrenn_view.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/order_details_view.dart';
import 'package:shopease/views/profile_view.dart';
import 'package:shopease/views/search_screen.dart';
import 'package:shopease/widgets/order_card_widget.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

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
        Icons.arrow_back, color: Colors.black,size: 28,
      ),
    ),
    title: const Text(
      "Order History",style: TextStyle(
        color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold,
      ),
    ),

    actions: [
      IconButton(
        onPressed: () {
          Get.to(()=>SearchScreen());
        },icon: const Icon(
          Icons.search,color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.to(() => const Cartscreenview());
        },
        icon: const Icon(
          Icons.shopping_cart_outlined,color: Colors.black,
        ),
      ),
    ],
  ),
      body: SafeArea(
        child: DefaultTabController(
          length: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SEARCH BAR
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
              // TAB BAR
              const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                indicatorColor: Color(0xFF7B2CF5),
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Color(0xFF7B2CF5),
                unselectedLabelColor: Colors.black87,
                tabs: [
                  Tab(text: 'All Orders'),
                  Tab(text: 'To Pay'),
                  Tab(text: 'Processing'),
                  Tab(text: 'To Ship'),
                  Tab(text: 'To Receive'),
                  Tab(text: 'Return/Refund'),
                  Tab(text: 'To Review'),
                ],
              ),
              const SizedBox(height: 10),
              //huhu
              Expanded(
                child: TabBarView(
                  children: [

                    // ALL ORDERS 
                    ListView(
                      padding: const EdgeInsets.all(16),
                      children: [

                        OrderCardWidget(
                          shopName: "Kathmandu Shop",
                          status: "Completed",
                          productName: "Nike Air Max",
                          color: "White Orange",
                          price: "Rs. 3000",
                          qty: "1",
                          total: "Rs. 3120",
                          image: "https://www.bing.com/th/id/OIP.tJQjxbLRRaEt9B4OB546kAHaHw?w=193&h=202&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
                             
                          onTap: () {
                          Get.to(() => const OrderDetailsView());
                          },

                          leftButtonText: "Return/Refund",
                          rightButtonText: "Buy Again",

                          onLeftTap: () {},
                          onRightTap: () {
                          },
                        ),

                        OrderCardWidget(
                          shopName: "Nepal Store",
                          status: "Processing",
                          productName: "Womens Handbag",
                          color: "Brown",
                          price: "Rs. 10000",
                          qty: "2",
                          total: "Rs. 20150",
                          image: "https://i5.walmartimages.com/seo/TAIAOJING-Womens-Handbags-Casual-Leather-Messenger-Bag-Large-Capacity-Handbag-Fashion-Bag_317c7ab0-780c-4476-baf2-aceaff2b65a3.2cbbebf7c4c0b06e46f83dc08f5e7253.jpeg",

                          leftButtonText: "Cancel Order",
                          rightButtonText: null,

                          onLeftTap: () {},
                        ),
                      ],
                    ),

                    // TO PAY 
                    const Center(child: Text("No orders yet")),

                   //Processing
                   ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                    OrderCardWidget(
                          shopName: "Nepal Store",
                          status: "Processing",
                          productName: "Womens Handbag",
                          color: "Brown",
                          price: "Rs. 10000",
                          qty: "2",
                          total: "Rs. 20150",
                          image: "https://i5.walmartimages.com/seo/TAIAOJING-Womens-Handbags-Casual-Leather-Messenger-Bag-Large-Capacity-Handbag-Fashion-Bag_317c7ab0-780c-4476-baf2-aceaff2b65a3.2cbbebf7c4c0b06e46f83dc08f5e7253.jpeg",

                          leftButtonText: "Cancel Order",
                          rightButtonText: null,

                          onLeftTap: () {},
                        ),
                      ],
                    ),
                    //  TO SHIP 
                    const Center(child: Text("No orders yet")),

                    //  TO RECEIVE 
                    const Center(child: Text("No orders yet")),

                    // RETURN / REFUND 
                    const Center(child: Text("No orders yet")),

                    //  TO REVIEW 
                    const Center(child: Text("No orders yet")),
                  ],
                ),
              ),              
            ],
          ),
        ),
      ),
    );
  }
}