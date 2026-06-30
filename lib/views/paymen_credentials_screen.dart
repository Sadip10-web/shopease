import 'package:flutter/material.dart';
import 'package:shopease/views/order_success.dart';

class PaymentCredentialsScreen extends StatefulWidget {
  final String paymentMethod;
  final double amount;
  final bool needsCredentials;
  final Color paymentColor;
  final String paymentAsset;

  const PaymentCredentialsScreen({
    super.key,
    required this.paymentMethod,
    required this.amount,
    required this.needsCredentials,
    required this.paymentColor,
    required this.paymentAsset,
  });

  @override
  State<PaymentCredentialsScreen> createState() =>
      _PaymentCredentialsScreenState();
}

class _PaymentCredentialsScreenState extends State<PaymentCredentialsScreen> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    mobileController.dispose();
    pinController.dispose();
    super.dispose();
  }

  Future<void> proceedPayment() async {
    if (widget.needsCredentials) {
      if (!formKey.currentState!.validate()) return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const OrderSuccessScreen(),
      ),
    );
  }

  String getInstructionText() {
    if (!widget.needsCredentials) {
      return "Your order will be placed with Cash on Delivery. You can pay after receiving your product.";
    }

    return "Enter your ${widget.paymentMethod} credentials to continue payment securely.";
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
        title: Text(
          widget.paymentMethod,
          style: const TextStyle(
            color: Color(0xFF09122C),
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 35),

                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.paymentColor.withOpacity(0.12),
                  ),
                  child: Center(
                    child: Image.asset(
                      widget.paymentAsset,
                      height: 62,
                      width: 62,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Text(
                  "${widget.paymentMethod} Payment",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF09122C),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  getInstructionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 34),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F3FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Payable Amount",
                        style: TextStyle(
                          color: Color(0xFF5B6475),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Rs.${widget.amount.toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Color(0xFF6D28FF),
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 34),

                if (widget.needsCredentials) ...[
                  TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      hintText: "Enter your mobile number",
                      prefixIcon: const Icon(Icons.phone),
                      filled: true,
                      fillColor: const Color(0xFFF8F8FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Mobile number is required";
                      }

                      if (value.trim().length < 10) {
                        return "Enter a valid mobile number";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  TextFormField(
                    controller: pinController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "PIN / Password",
                      hintText: "Enter your PIN or password",
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: const Color(0xFFF8F8FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "PIN or password is required";
                      }

                      if (value.trim().length < 4) {
                        return "PIN must be at least 4 digits";
                      }

                      return null;
                    },
                  ),
                ],

                const SizedBox(height: 36),

                SizedBox(
                  width: double.infinity,
                  height: 62,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : proceedPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6D28FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 26,
                            width: 26,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.8,
                            ),
                          )
                        : const Text(
                            "PROCEED",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: TextButton(
                    onPressed: isLoading ? null : () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xFF6D28FF),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}