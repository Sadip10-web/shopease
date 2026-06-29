import 'package:flutter/material.dart';
// import 'package:shopease/views/wishlist_view.dart';

class Cartscreenview extends StatefulWidget {
  const Cartscreenview({super.key});

  @override
  State<Cartscreenview> createState() => _CartscreenviewState();
}

class _CartscreenviewState extends State<Cartscreenview> {
  Widget cartSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Total: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Rs. ${getTotalPrice().toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text("Shipping Fee: "),
                      const Text(
                        "Rs.150",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 87, 7, 236),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  "CheckOut",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void deleteSelectedItems() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Items"),
        content: const Text("Are you sure you want to delete selected items?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                for (int i = products.length - 1; i >= 0; i--) {
                  if (isChecked[i] == true) {
                    products.removeAt(i);
                    isChecked.removeAt(i);
                    quantity.removeAt(i);
                  }
                }
              });
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  // Sample data
  final List<Map<String, dynamic>> products = [
    {
      "image":
          "https://www.bing.com/th/id/OIP.tJQjxbLRRaEt9B4OB546kAHaHw?w=193&h=202&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Premium Nike Sneakers",
      "shop": "Nike Store",
      "currentPrice": 12000,
      "oldPrice": 15000,
    },
    {
      "image":
          "https://www.bing.com/th/id/OIP.P3Y-J0w1E9u1aFk-Ok-LxgHaHb?w=193&h=194&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Adidas Ultraboost",
      "shop": "Adidas Store",
      "currentPrice": 18000,
      "oldPrice": 22000,
    },
    {
      "image":
          "https://th.bing.com/th/id/OIP.qn83e-h0t1cg9wJzQ0ICRgHaHs?w=176&h=182&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      "name": "A Grade Nepal Jersey",
      "shop": "Nepal Store",
      "currentPrice": 9000,
      "oldPrice": 12000,
    },
    {
      "image":
          "https://i5.walmartimages.com/seo/TAIAOJING-Womens-Handbags-Casual-Leather-Messenger-Bag-Large-Capacity-Handbag-Fashion-Bag_317c7ab0-780c-4476-baf2-aceaff2b65a3.2cbbebf7c4c0b06e46f83dc08f5e7253.jpeg",
      "name": "Womens Handbag",
      "shop": "Nepal Store",
      "currentPrice": 7000,
      "oldPrice": 10000,
    },
    {
      "image":
          "https://tse1.mm.bing.net/th/id/OIP.R3sDWRvUKYroXQlLGD6wcQHaHI?rs=1&pid=ImgDetMain&o=7&rm=3",
      "name": "Asus Laptop",
      "shop": "Nepal Store",
      "currentPrice": 90000,
      "oldPrice": 100000,
    },
  ];

  late List<bool> isChecked;
  late List<int> quantity;

  @override
  void initState() {
    super.initState();
    isChecked = List<bool>.filled(products.length, false, growable: true);
    quantity = List<int>.filled(products.length, 1, growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
        ),
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: deleteSelectedItems,
            icon: const Icon(Icons.delete_outlined, color: Colors.black),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return cartItem(
                  index: index,
                  imageUrl: products[index]["image"]!,
                  productName: products[index]["name"]!,
                  shopName: products[index]["shop"]!,
                  currentPrice: products[index]["currentPrice"].toString(),
                  oldPrice: products[index]["oldPrice"].toString(),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: cartSummary(),
    );
  }

  // Reusable Cart Item Widget
  Widget cartItem({
    required int index,
    required String imageUrl,
    required String productName,
    required String shopName,
    required String currentPrice,
    required String oldPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 8),
      child: Row(
        children: [
          Checkbox(
            value: isChecked[index],
            onChanged: (value) {
              setState(() => isChecked[index] = value!);
            },
            shape: const CircleBorder(),
            activeColor: const Color(0xFF6D28FF),
            checkColor: Colors.white,
          ),
          Expanded(
            child: Container(
              height: 105,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 5, color: Colors.black12),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          shopName,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rs. ${products[index]["currentPrice"]}",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Rs. ${products[index]["oldPrice"]}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity[index] > 1) {
                                        quantity[index]--;
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.indeterminate_check_box_outlined,
                                  ),
                                ),
                                Text(
                                  quantity[index].toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() => quantity[index]++);
                                  },
                                  icon: const Icon(Icons.add_box_outlined),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double getTotalPrice() {
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      if (isChecked[i]) {
        total += (products[i]["currentPrice"] as int) * quantity[i];
      }
    }
    return total;
  }
}
