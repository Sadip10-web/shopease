import 'package:flutter/material.dart';
import 'package:shopease/views/paymen_credentials_screen.dart';

class PaymentMethod {
  final String name;
  final String asset;
  final Color color;
  final bool needsCredentials;

  PaymentMethod({
    required this.name,
    required this.asset,
    required this.color,
    required this.needsCredentials,
  });
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedMethod = 0;

  final double amount = 7500;

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      name: "eSewa",
      asset: "assets/images/esewa.png",
      color: Colors.green,
      needsCredentials: true,
    ),
    PaymentMethod(
      name: "Khalti",
      asset: "assets/images/khalti.png",
      color: Colors.purple,
      needsCredentials: true,
    ),
    PaymentMethod(
      name: "FonePay",
      asset: "assets/images/fonepay.png",
      color: Colors.red,
      needsCredentials: true,
    ),
    PaymentMethod(
      name: "Cash on Delivery",
      asset: "assets/images/cod.png",
      color: Colors.orange,
      needsCredentials: false,
    ),
  ];

  Widget paymentOption({
    required int value,
    required PaymentMethod method,
    required bool isSmall,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMethod = value;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isSmall ? 8 : 12,
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: isSmall ? 0.9 : 1,
              child: Radio<int>(
                value: value,
                groupValue: selectedMethod,
                activeColor: const Color(0xFF6D28FF),
                onChanged: (val) {
                  setState(() {
                    selectedMethod = val!;
                  });
                },
              ),
            ),

            SizedBox(width: isSmall ? 4 : 8),

            Image.asset(
              method.asset,
              height: isSmall ? 34 : 46,
              width: isSmall ? 34 : 46,
              fit: BoxFit.contain,
            ),

            SizedBox(width: isSmall ? 14 : 22),

            Expanded(
              child: Text(
                method.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isSmall ? 15 : 19,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF09122C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void payNow() {
    final selectedPayment = paymentMethods[selectedMethod];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentCredentialsScreen(
          paymentMethod: selectedPayment.name,
          amount: amount,
          needsCredentials: selectedPayment.needsCredentials,
          paymentColor: selectedPayment.color,
          paymentAsset: selectedPayment.asset,
        ),
      ),
    );
  }

  void cancelPayment() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF09122C),
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Color(0xFF09122C),
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final isSmall = screenWidth < 380;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 430,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmall ? 14 : 20,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: Color(0xFFE5E7EB),
                        thickness: 1,
                      ),

                      SizedBox(height: isSmall ? 14 : 24),

                      Text(
                        "Select Payment Method",
                        style: TextStyle(
                          color: const Color(0xFF5B6475),
                          fontSize: isSmall ? 16 : 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: isSmall ? 14 : 22),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmall ? 8 : 14,
                          vertical: isSmall ? 6 : 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            isSmall ? 18 : 24,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            paymentOption(
                              value: 0,
                              method: paymentMethods[0],
                              isSmall: isSmall,
                            ),
                            const Divider(color: Color(0xFFE5E7EB)),

                            paymentOption(
                              value: 1,
                              method: paymentMethods[1],
                              isSmall: isSmall,
                            ),
                            const Divider(color: Color(0xFFE5E7EB)),

                            paymentOption(
                              value: 2,
                              method: paymentMethods[2],
                              isSmall: isSmall,
                            ),
                            const Divider(color: Color(0xFFE5E7EB)),

                            paymentOption(
                              value: 3,
                              method: paymentMethods[3],
                              isSmall: isSmall,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isSmall ? 22 : 34),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmall ? 18 : 24,
                          vertical: isSmall ? 20 : 28,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F3FF),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                      fontSize: isSmall ? 16 : 19,
                                      color: const Color(0xFF5B6475),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  SizedBox(height: isSmall ? 8 : 12),

                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Rs.7500",
                                      style: TextStyle(
                                        fontSize: isSmall ? 34 : 42,
                                        fontWeight: FontWeight.w900,
                                        color: const Color(0xFF5B2DFF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: isSmall ? 12 : 20),

                            Container(
                              width: isSmall ? 62 : 82,
                              height: isSmall ? 62 : 82,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE8DEFF),
                              ),
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: const Color(0xFF6D28FF),
                                size: isSmall ? 32 : 42,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isSmall ? 18 : 26),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmall ? 16 : 22,
                          vertical: isSmall ? 16 : 22,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F3FF),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified_user,
                              color: const Color(0xFF6D28FF),
                              size: isSmall ? 28 : 36,
                            ),

                            SizedBox(width: isSmall ? 12 : 18),

                            Expanded(
                              child: Text(
                                "You will be redirected to the selected payment provider to complete the payment securely.",
                                style: TextStyle(
                                  fontSize: isSmall ? 13 : 16,
                                  height: 1.45,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isSmall ? 24 : 34),

                      SizedBox(
                        width: double.infinity,
                        height: isSmall ? 54 : 64,
                        child: ElevatedButton(
                          onPressed: payNow,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6D28FF),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(
                            "PAY NOW",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmall ? 18 : 21,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}