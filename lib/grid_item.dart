import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const GridItem({
    Key? key,
    required this.category,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // Set your desired radius
              child: Image.asset(
                category['logo'],
                height: 70,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8.0),
            Text(category['name']),
          ],
        ),
      ),
    );
  }
}
