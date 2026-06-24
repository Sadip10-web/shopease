import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() =>
      _OrderSuccessScreenState();
}

class _OrderSuccessScreenState
    extends State<OrderSuccessScreen> {

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Stack(

          alignment: Alignment.topCenter,

          children: [

            /// Confetti

            ConfettiWidget(

              confettiController:
                  confettiController,

              blastDirectionality:
                  BlastDirectionality.explosive,

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

            Padding(

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 24,
              ),

              child: Column(

                children: [

                  const SizedBox(height: 80),

                  /// Success icon

                  Stack(

                    alignment: Alignment.center,

                    children: [

                      Container(

                        width: 130,

                        height: 130,

                        decoration: const BoxDecoration(

                          shape: BoxShape.circle,

                          color: Color(
                            0xFFF1F3F2,
                          ),
                        ),
                      ),

                      Container(

                        width: 60,

                        height: 60,

                        decoration: const BoxDecoration(

                          shape: BoxShape.circle,

                          color: Color(
                            0xFF4CD137,
                          ),
                        ),

                        child: const Icon(

                          Icons.check,

                          color: Colors.white,

                          size: 40,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  const Text(

                    "Order Successful",

                    style: TextStyle(

                      fontSize: 38,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          Color(0xFF09122C),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(

                    "Thank you! Your order has been placed successfully.",

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      fontSize: 18,

                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 45),

                  /// Order card

                  Container(

                    padding:
                        const EdgeInsets.all(
                      22,
                    ),

                    decoration: BoxDecoration(

                      color: const Color(
                        0xFFF2F5F4,
                      ),

                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Row(

                      children: [

                        Container(

                          width: 60,

                          height: 60,

                          decoration:
                              const BoxDecoration(

                            shape:
                                BoxShape.circle,

                            color:
                                Color(
                              0xFFD7F0D5,
                            ),
                          ),

                          child: const Icon(

                            Icons.receipt_long,

                            color:
                                Color(
                              0xFF4CD137,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 18,
                        ),

                        Column(

                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: const [

                            Text(

                              "Order ID:",

                              style:
                                  TextStyle(

                                fontSize:
                                    18,

                                color:
                                    Colors
                                        .grey,
                              ),
                            ),

                            SizedBox(
                              height: 5,
                            ),

                            Text(

                              "#12345",

                              style:
                                  TextStyle(

                                fontSize:
                                    26,

                                color:
                                    Color(
                                  0xFF4CD137,
                                ),

                                fontWeight:
                                    FontWeight
                                        .w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  const Spacer(),

                  /// View orders button

                  SizedBox(

                    width:
                        double.infinity,

                    height: 60,

                    child: ElevatedButton(

                      style:
                          ElevatedButton
                              .styleFrom(

                        elevation: 0,

                        backgroundColor:
                            const Color(
                          0xFF6D28FF,
                        ),

                        shape:
                            RoundedRectangleBorder(

                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),
                        ),
                      ),

                      onPressed: () {},

                      child: const Row(

                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,

                        children: [

                          Icon(
                            Icons.shopping_basket,
                            color:
                                Colors.white,
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Text(

                            "View Orders",

                            style:
                                TextStyle(

                              fontSize:
                                  20,

                              fontWeight:
                                  FontWeight.w500,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Continue shopping button

                  SizedBox(

                    width:
                        double.infinity,

                    height: 60,

                    child:
                        OutlinedButton(

                      style:
                          OutlinedButton
                              .styleFrom(

                        side:
                            const BorderSide(

                          color:
                              Color(
                            0xFF6D28FF,
                          ),
                        ),

                        shape:
                            RoundedRectangleBorder(

                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),
                        ),
                      ),

                      onPressed: () {},

                      child: const Row(

                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,

                        children: [

                          Icon(

                            Icons.shopping_bag,

                            color:
                                Color(
                              0xFF6D28FF,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Text(

                            "Continue Shopping",

                            style:
                                TextStyle(

                              color:
                                  Color(
                                0xFF6D28FF,
                              ),

                              fontSize:
                                  20,

                              fontWeight:
                                  FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}