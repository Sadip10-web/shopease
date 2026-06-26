import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product_card extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String oldPrice;
  final String newPrice;
  const Product_card({
    super.key,
    required this.imageUrl,
    required this.oldPrice,
    required this.newPrice,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
        
        height: 305,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                imageUrl,
                width:200,
                height: 200,
                ),
                Row(
                  children: [
                    Text(productTitle,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    ),
                    Spacer(),
                    IconButton(
                      
                      onPressed: (){
                        // Icon(CupertinoIcons.heart_fill,
                        // color: Colors.red,);
                      }, 
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: Colors.red,
                        )
                        ),
                        
                  ],
                ),
                Text(
                      newPrice,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 16, 187, 0),
                        // decoration: TextDecoration.lineThrough,
                      ),
                      ),
                // price section inside same sizedbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    Text(
                      "Price: ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        
                        // decoration: TextDecoration.lineThrough,
                      ),
                      ),
                      Text(
                      oldPrice,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 0, 0),
                        
                        decoration: TextDecoration.lineThrough,
                      ),
                      ),
                    
                  ],
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
