// product detail

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopease/views/cartScrenn_view.dart';
import 'package:shopease/views/payment_screen.dart';
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
  bool isDescriptionExpanded = false;

  final List<String> sizes = ['6', '7', '8', '9', '10', '11'];

  final List<Color> colorOptions = [
    Colors.white,
    Colors.black,
    const Color(0xFF8C2AE7),
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          "Details",
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
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              imageSlider(),
              const Gap(15),
              fourImages(),
              productTitle(),
              price(),
              Divider(color: Colors.grey.shade200),
              description(),
              const Gap(15),
              sizeSelector(),
              colorSelector(),
              Divider(color: Colors.grey.shade200),
              deliveryInfo(),
              Divider(color: Colors.grey.shade200),
              bottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageSlider() {
    return Container(
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
              onPageChanged: (index) {
                setState(() {
                  currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image_outlined,
                      size: 90,
                      color: Colors.grey.shade300,
                    ),
                  ),
                );
              },
            ),
          ),
          slideBar(),
        ],
      ),
    );
  }

  Widget slideBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(images.length, (index) {
          final bool isActive = index == currentImageIndex;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: isActive ? 18 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF6D28FF) : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
      ),
    );
  }

  Widget fourImages() {
    return Padding(
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
    );
  }

  Widget productTitle() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product_Name",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: 4),
                  Text(
                    "4.6",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                "(128 reviews)",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget price() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          const Text(
            "Rs. 5,399",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6D28FF),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "Rs. 6,000",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade400,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE3E3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
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
    );
  }

  Widget description() {
    const String description =
        "The morning breeze drifted through the quiet streets as the city slowly came to life. People hurried toward their destinations, carrying hopes, plans, and the promise of a new day.";

    return Padding(
      padding: const EdgeInsets.all(4),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: isDescriptionExpanded
                  ? description
                  : "${description.substring(0, 90)}...",
            ),
            TextSpan(
              text: isDescriptionExpanded ? " Read less" : " Read more",
              style: const TextStyle(
                color: Color(0xFF6D28FF),
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    isDescriptionExpanded = !isDescriptionExpanded;
                  });
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeSelector() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Size",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(sizes.length, (index) {
              final bool isSelected = index == selectedSizeIndex;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSizeIndex = index;
                      });
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6D28FF)
                            : const Color(0xFFF3F1FB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        sizes[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
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
    );
  }

  Widget colorSelector() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Color',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(colorOptions.length, (index) {
              final bool isSelected = index == selectedColorIndex;

              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorOptions[index],
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF6D28FF)
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
    );
  }

  Widget deliveryInfo() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          infoItem(
            Icons.local_shipping_outlined,
            "Free Delivery",
            "Inside Valley\n2-3 days",
          ),
          const Spacer(),
          infoItem(
            Icons.verified_outlined,
            "100% original",
            "Authentic\nProducts",
          ),
          const Spacer(),
          infoItem(Icons.cached, "Easy Returns", "within 7 days\nof delivery"),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              buttonText: "Add to Cart",
              backgroundColor: const Color(0xffF5F6FA),
              color: const Color(0xFF6D28FF),
              onPressed: () {
                Get.to(() => Cartscreenview());
              },
              icon: Icons.shopping_cart_outlined,
              iconColor: const Color(0xFF6D28FF),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ButtonWidget(
              buttonText: "Buy Now",
              backgroundColor: const Color(0xFF6D28FF),
              color: Colors.white,
              onPressed: () {
                Get.to(() => PaymentScreen());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget infoItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F1FB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF6D28FF), size: 20),
        ),
        const SizedBox(width: 8),
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
}
