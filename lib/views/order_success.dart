import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/order_history_view.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();

    confettiController = ConfettiController(
      duration: const Duration(seconds: 4),
    );

    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  void viewOrders() {
    // Navigate to your orders screen here.
  }

  void continueShopping() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;
            final isSmall = screenWidth < 380;
            final isShort = screenHeight < 700;

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                ConfettiWidget(
                  confettiController: confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  numberOfParticles: 30,
                  emissionFrequency: 0.04,
                  gravity: 0.15,
                  colors: const [
                    Color(0xFF4CD137),
                    Color(0xFFA29BFE),
                    Color(0xFFFDCB6E),
                    Color(0xFFB8E994),
                  ],
                ),

                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 430,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmall ? 18 : 24,
                        vertical: isShort ? 20 : 30,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: screenHeight -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom -
                              40,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: isShort ? 18 : 55),

                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: isSmall ? 125 : 160,
                                  height: isSmall ? 125 : 160,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color(0xFF4CD137).withOpacity(0.08),
                                  ),
                                ),

                                Container(
                                  width: isSmall ? 95 : 115,
                                  height: isSmall ? 95 : 115,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        const Color(0xFF4CD137).withOpacity(0.14),
                                  ),
                                ),

                                Container(
                                  width: isSmall ? 68 : 82,
                                  height: isSmall ? 68 : 82,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF4CD137),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: isSmall ? 42 : 50,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: isSmall ? 28 : 40),

                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Order Successful",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: isSmall ? 31 : 38,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF09122C),
                                ),
                              ),
                            ),

                            SizedBox(height: isSmall ? 10 : 16),

                            Text(
                              "Thank you! Your order has been placed successfully.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: isSmall ? 16 : 19,
                                height: 1.5,
                                color: const Color(0xFF6B7280),
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: isSmall ? 30 : 48),

                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                horizontal: isSmall ? 4 : 26,
                              ),
                              padding: EdgeInsets.all(isSmall ? 16 : 22),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1FAF2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: isSmall ? 58 : 72,
                                    height: isSmall ? 58 : 72,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFDDF7DF),
                                    ),
                                    child: Icon(
                                      Icons.receipt_long,
                                      color: const Color(0xFF4CD137),
                                      size: isSmall ? 28 : 34,
                                    ),
                                  ),

                                  SizedBox(width: isSmall ? 14 : 22),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Order ID:",
                                          style: TextStyle(
                                            fontSize: isSmall ? 16 : 19,
                                            color: const Color(0xFF6B7280),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        SizedBox(height: isSmall ? 4 : 6),

                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "#12345",
                                            style: TextStyle(
                                              fontSize: isSmall ? 24 : 28,
                                              color: const Color(0xFF4CD137),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: isShort ? 38 : 90),

                            SizedBox(
                              width: double.infinity,
                              height: isSmall ? 56 : 64,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xFF6D28FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: (){
                                  Get.to(() => OrderHistoryView());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_basket_outlined,
                                      color: Colors.white,
                                      size: isSmall ? 24 : 28,
                                    ),

                                    SizedBox(width: isSmall ? 10 : 14),

                                    Text(
                                      "View Orders",
                                      style: TextStyle(
                                        fontSize: isSmall ? 18 : 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: isSmall ? 16 : 22),

                            SizedBox(
                              width: double.infinity,
                              height: isSmall ? 56 : 64,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Color(0xFF6D28FF),
                                    width: 1.6,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: (){
                                  Get.offAll(() => HomeScreen(),
                                  transition: Transition.rightToLeftWithFade);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      color: const Color(0xFF6D28FF),
                                      size: isSmall ? 24 : 28,
                                    ),

                                    SizedBox(width: isSmall ? 10 : 14),

                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Continue Shopping",
                                          style: TextStyle(
                                            color: const Color(0xFF6D28FF),
                                            fontSize: isSmall ? 18 : 22,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}