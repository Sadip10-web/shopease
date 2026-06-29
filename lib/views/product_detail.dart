import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopease/views/cartScrenn_view.dart';
import 'package:shopease/views/order_details_view.dart';
import 'package:shopease/widgets/button_widget.dart';

ValueNotifier<bool> addFavorite = ValueNotifier(false);

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final PageController pageController = PageController();
  int currentImageIndex = 0;
  int selectedSizeIndex = 0;
  int selectedColorIndex = 0;

  final List<String> sizes = ['6', '7', '8', '9', '10', '11'];
  final List<Color> colorOptions = [
    Colors.white,
    Colors.black,
    Color(0xFF8C2AE7),
  ];

  final List<String> images = [
    'https://i.pinimg.com/736x/18/6b/a7/186ba725b7390c2621adb344ccb30ffc.jpg',
    'https://i.pinimg.com/736x/82/f4/f9/82f4f92d83b7d6feeb68769d425b5954.jpg',
    'https://i.pinimg.com/736x/64/6c/fe/646cfe978869e8079aee0932307c6b42.jpg',
    'https://i.pinimg.com/736x/2f/ea/40/2fea40bec026594df56f547eb6dba1be.jpg',
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            "Details",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                addFavorite.value = !addFavorite.value;
              },
              icon: ValueListenableBuilder(
                valueListenable: addFavorite,
                builder: (context, value, child) {
                  return Icon(
                    value ? Icons.favorite : Icons.favorite_border,
                    color: value ? Colors.red : Colors.grey,
                  );
                },
              ),
            ),


            IconButton(
              onPressed: () {
                Get.to(() => Cartscreenview());
              }, 
              icon: Icon(Icons.shopping_cart)
            ),
          ], // Action


        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //ImageSlider
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F1FB),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: images.length,
                        onPageChanged: (index) =>
                            setState(() => currentImageIndex = index),

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 6),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;

                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    Icons.image_outlined,
                                    size: 90,
                                    color: Colors.grey.shade300,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          final bool isActive = index == currentImageIndex;
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            width: isActive ? 18 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? Color(0xFF6D28FF)
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              Gap(15),

              //4 images
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    children: List.generate(images.length, (index) {
                      final bool isSelected = index == currentImageIndex;
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {
                              pageController.animateToPage(
                                index,
                                duration: Duration(microseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Container(
                              // width: 70,
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F1FB),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? Color(0xFF6D28FF)
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              //ProductName and review
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product_Name",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Sub_title",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              "4.6",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Text(
                          "(128 reviews)",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Price
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Text(
                      "Rs. 5,399",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6D28FF),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Rs. 6,000",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE3E3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "10% OFF",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFE05A5A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(color: Colors.grey.shade200),

              //Description
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "The morning breeze drifted through the quiet streets as the city slowly came to life. People hurried toward their destinations, carrying hopes, plans, and the promise of a new day.",
                      ),
                      TextSpan(
                        text: " Read more",
                        style: TextStyle(
                          color: Color(0xFF6D28FF),
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //TODO: expand to show the full description
                          },
                      ),
                    ],
                  ),
                ),
              ),

              Gap(15),

              //Size Selector
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Size Guide",
                            style: TextStyle(
                              color: Color(0xFF6D28FF),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: List.generate(sizes.length, (index) {
                        final bool isSelected = index == selectedSizeIndex;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 4,
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => selectedSizeIndex = index),
                              child: Container(
                                width: 44,
                                height: 44,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Color(0xFF6D28FF)
                                      : Color(0xFFF3F1FB),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  sizes[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              //Color Selector
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: List.generate(colorOptions.length, (index) {
                        final bool isSelected = index == selectedColorIndex;
                        return Padding(
                          padding: EdgeInsetsGeometry.only(right: 14),
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => selectedColorIndex = index),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorOptions[index],
                                border: Border.all(
                                  color: isSelected
                                      ? Color(0xFF6D28FF)
                                      : Colors.grey.shade400,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              Divider(color: Colors.grey.shade200),

              //delivery
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    infoItem(
                      Icons.local_shipping_outlined,
                      "Free Delivery",
                      "Inside Valley\n2-3 days",
                    ),
                    Spacer(),
                    infoItem(
                      Icons.verified_outlined,
                      "100% original",
                      "Authentic\nProducts",
                    ),
                    Spacer(),
                    infoItem(
                      Icons.cached,
                      "Easy Returns",
                      "within 7 days\nof delivery",
                    ),
                  ],
                ),
              ),

              Divider(color: Colors.grey.shade200),

              //Bottom Bar
              Container(
                padding: EdgeInsets.fromLTRB(20, 14, 20, 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 12,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        buttonText: "Add to Card",
                        backgroundColor: Color(0xffF5F6FA),
                        color: Color(0xFF6D28FF),
                        onPressed: () {
                          Get.to(() => Cartscreenview());
                        },
                        icon: Icons.shopping_cart_outlined,
                        iconColor: Color(0xFF6D28FF),
                      ),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: ButtonWidget(
                        buttonText: "Buy Now",
                        backgroundColor: Color(0xFF6D28FF),
                        color: Colors.white,
                        onPressed: () {
                          Get.to(() => OrderDetailsView());
                        },
                      ),
                    ),
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

Widget infoItem(IconData icon, String title, String subtitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFF3F1FB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Color(0xFF6D28FF), size: 20),
      ),
      SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    ],
  );
}
