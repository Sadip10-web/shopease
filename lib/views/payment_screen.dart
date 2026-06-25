// ======================= Modified Code ==========================//
//=================================================================//
//=================================================================//


import 'package:flutter/material.dart';
import 'package:shopease/widgets/Screentitle.dart';
import 'package:shopease/widgets/button_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  int selectedMethod = 0;

  Widget paymentOption({
    required int value,
    required String image,
    required String title,
    required Color textColor,
  }) {
    return Row(
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

        Image.asset(
          image,
          height: 28,
          width: 28,
        ),

        const SizedBox(width: 18),

        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        centerTitle: true,

        title: const Text(
          "Payment",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Divider(),
              const SizedBox(height: 10),

              const Text(
                "Select Payment Method",

                style: TextStyle(
                  color: Color(0xFF5B6475),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 15),

              /// Payment methods card
              Card(

                color: Colors.white,

                elevation: 2,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),

                  child: Column(

                    children: [

                      paymentOption(
                        value: 0,
                        image: "assets/images/esewa.png",
                        title: "eSewa",
                        textColor: Colors.green,
                      ),

                      const Divider(
                        color: Color(0xFFE5E7EB),
                      ),

                      paymentOption(
                        value: 1,
                        image: "assets/images/esewa.png",
                        title: "Khalti",
                        textColor: Colors.purple,
                      ),

                      const Divider(
                        color: Color(0xFFE5E7EB),
                      ),

                      paymentOption(
                        value: 2,
                        image: "assets/images/esewa.png",
                        title: "FonePay",
                        textColor: Colors.black,
                      ),

                      const Divider(
                        color: Color(0xFFE5E7EB),
                      ),

                      paymentOption(
                        value: 3,
                        image: "assets/images/esewa.png",
                        title: "Cash on Delivery",
                        textColor: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              /// Amount card

              Container(

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: const Color(0xFFF6F3FF),

                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: const [

                        Text(
                          "Amount:",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Rs. 7500",

                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6D28FF),
                          ),
                        ),
                      ],
                    ),

                    Container(

                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: const Color(0xFF6D28FF),

                        borderRadius:
                            BorderRadius.circular(10),
                      ),

                      child: const Icon(
                        Icons.wallet,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Info card

              Container(

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(

                  color: const Color(0xFFF6F3FF),

                  borderRadius:
                      BorderRadius.circular(18),
                ),

                child: Row(

                  children: [

                    const Icon(
                      Icons.verified_user,
                      color: Color(0xFF6D28FF),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        "You will be redirected to the selected payment provider to complete the payment securely.",

                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,

                height: 60,

                child: ButtonWidget(
                  buttonText: "Pay Now", 
                  backgroundColor: Color(0xFF6D28FF), 
                  onPressed: (){}),

                // child: FilledButton(

                //   style: FilledButton.styleFrom(

                //     backgroundColor:
                //         const Color(0xFF6D28FF),

                //     shape:
                //         RoundedRectangleBorder(
                //       borderRadius:
                //           BorderRadius.circular(16),
                //     ),
                //   ),

                //   onPressed: () {},

                //   child: const Text(

                //     "Pay Now",

                //     style: TextStyle(
                //       fontSize: 22,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}