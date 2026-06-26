import 'package:flutter/material.dart';

class FeaturedCard extends StatefulWidget {
  final String ImageUrl;
  
  const FeaturedCard({
    super.key,
    required this.ImageUrl,
  });

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: Container(
        width: 250.0,
        height: 200.0,
        decoration: BoxDecoration(
          // 1. Set the corner radius
          borderRadius: BorderRadius.circular(20.0),
      
          // 2. Add the drop shadow
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withAlpha(80),// Shadow color
              spreadRadius: 2,                     // How much the shadow expands
              blurRadius: 10,                       // How blurry the shadow is
              offset: const Offset(0, 2),          // Shadow position (x, y)
            ),
          ],
      
          // 3. Insert the network image
          image: DecorationImage(
            image: NetworkImage(widget.ImageUrl), // Fixed: accesses stateful property
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
