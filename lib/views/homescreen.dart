// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopease/widgets/featured_card.dart';
import 'package:shopease/widgets/fillUp_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopease/widgets/product_card.dart';
import 'package:shopease/widgets/tags_widget.dart';
// import 'package:shopease/widgets/wishlist_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Welcome to ", style: TextStyle(fontSize: 17)),
                      Text(
                        "ShopEase !",
                        style: GoogleFonts.itim(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,

                          color: Color(0xFF6D28FF),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Hello, ", style: TextStyle(fontSize: 17)),
                      Text(
                        "Mahesh. ",
                        style: GoogleFonts.itim(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,

                          color: Color(0xFF6D28FF),
                        ),
                      ),
                      Text("Greetings !!", style: TextStyle(fontSize: 17)),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          size: 30,
                          Theme.of(context).brightness == Brightness.light
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        ),
                        onPressed: () {
                          // Toggle theme here
                        },
                      ),
                    ],
                  ),
                  Gap(10),
                  // search area
                  FillupWidget(
                    placeHolder: "Search Here",
                    icon: Icons.search,

                    keyboardType: TextInputType.text,
                  ),
                  Gap(10),

                  // tags area
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      child: Row(
                        children: [
                          TagsWidget(label: "All", icon: Icons.travel_explore),
                          Gap(10),
                          TagsWidget(label: "Fashion", icon: Icons.checkroom),
                          Gap(10),
                          TagsWidget(label: "Wearables", icon: Icons.watch),
                          Gap(10),
                          TagsWidget(
                            label: "Shoes",
                            icon: Icons.directions_run,
                          ),
                          Gap(10),
                          TagsWidget(
                            label: "Smartphone",
                            icon: Icons.smartphone,
                          ),
                          Gap(10),
                          TagsWidget(
                            label: "Smartphone",
                            icon: Icons.smartphone,
                          ),
                          Gap(10),
                        ],
                      ),
                    ),
                  ),
                  Gap(10),
                  //featured area
                  Row(
                    children: [
                      Text(
                        "Featured ",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.flame_fill,
                        color: const Color.fromARGB(255, 255, 115, 0),
                        size: 35,
                      ),
                    ],
                  ),
                  Gap(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FeaturedCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D',
                        ),

                        FeaturedCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D',
                        ),

                        FeaturedCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D',
                        ),

                        FeaturedCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D',
                        ),

                        FeaturedCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D',
                        ),

                        FeaturedCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGVhZHBob25lc3xlbnwwfHwwfHx8MA%3D%3D',
                        ),
                        Gap(20),
                      ],
                    ),
                  ),
                  Gap(10),

                  //  top picks area
                  Row(
                    children: [
                      Text(
                        "Top Picks ",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                        size: 35,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Product_card(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                          oldPrice: "1700",
                          newPrice: "1200222",
                          productTitle: "Headset",
                        ),

                        Gap(10),

                        Product_card(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                          oldPrice: "1700",
                          newPrice: "1200222",
                          productTitle: "Headset",
                        ),

                        Gap(10),

                        Product_card(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                          oldPrice: "1700",
                          newPrice: "1200222",
                          productTitle: "Headset",
                        ),

                        Gap(10),

                        Product_card(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                          oldPrice: "1700",
                          newPrice: "1200222",
                          productTitle: "Headset",
                        ),

                        Gap(10),

                        Product_card(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                          oldPrice: "1700",
                          newPrice: "1200222",
                          productTitle: "Headset",
                        ),

                        Gap(10),

                        Product_card(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                          oldPrice: "1700",
                          newPrice: "1200222",
                          productTitle: "Headset",
                        ),
                      ],
                    ),
                  ),

                  Gap(10),
                  // for you
                  Row(
                    children: [
                      Text(
                        "For You ",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.bag_fill,
                        color: const Color.fromARGB(255, 255, 115, 0),
                        size: 35,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                          Gap(75),
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                          Gap(75),
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                          Gap(75),
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                          Gap(75),
                          Product_card(
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
                            oldPrice: "1700",
                            newPrice: "1200222",
                            productTitle: "Headset",
                          ),
                        ],
                      ),
                    ],
                  ),
                ], //children
              ),
            ),
          ),
        ),
      ),
    );
  }
}
