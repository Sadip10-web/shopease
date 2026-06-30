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
  }) {
    final bool isSelected = selectedMethod == value;

    return InkWell(
      onTap: () {
        setState(() {
          selectedMethod = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Radio<int>(
              value: value,
              groupValue: selectedMethod,
              activeColor: const Color(0xFF6D28FF),
              onChanged: (val) {
                setState(() {
                  selectedMethod = val!;
                });
              },
            ),

            const SizedBox(width: 8),

            Image.asset(
              method.asset,
              height: 46,
              width: 46,
              fit: BoxFit.contain,
            ),

            const SizedBox(width: 22),

            Expanded(
              child: Text(
                method.name,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? const Color(0xFF09122C)
                      : const Color(0xFF09122C),
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
            size: 30,
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Color(0xFF09122C),
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Color(0xFFE5E7EB),
                thickness: 1,
              ),

              const SizedBox(height: 24),

              const Text(
                "Select Payment Method",
                style: TextStyle(
                  color: Color(0xFF5B6475),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 22),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 22,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    paymentOption(
                      value: 0,
                      method: paymentMethods[0],
                    ),
                    const Divider(color: Color(0xFFE5E7EB)),

                    paymentOption(
                      value: 1,
                      method: paymentMethods[1],
                    ),
                    const Divider(color: Color(0xFFE5E7EB)),

                    paymentOption(
                      value: 2,
                      method: paymentMethods[2],
                    ),
                    const Divider(color: Color(0xFFE5E7EB)),

                    paymentOption(
                      value: 3,
                      method: paymentMethods[3],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 34),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F3FF),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                            fontSize: 19,
                            color: Color(0xFF5B6475),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          "Rs.7500",
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF5B2DFF),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 82,
                      height: 82,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE8DEFF),
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet,
                        color: Color(0xFF6D28FF),
                        size: 42,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F3FF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.verified_user,
                      color: Color(0xFF6D28FF),
                      size: 36,
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Text(
                        "You will be redirected to the selected payment provider to complete the payment securely.",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 34),

              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: payNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6D28FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "PAY NOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: OutlinedButton(
                  onPressed: cancelPayment,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF6D28FF),
                      width: 1.4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "CANCEL PAYMENT",
                    style: TextStyle(
                      color: Color(0xFF6D28FF),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}