import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';
import 'grid_item.dart';

class SubcategoryScreen extends StatelessWidget {
  final Map<String, dynamic> category;

  SubcategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category['name'],style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF285429),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF285429),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        itemCount: category['subCategory'].length,
        itemBuilder: (context, index) {
          return GridItem(
            category: category['subCategory'][index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    category: category['name'],
                    subcategory: category['subCategory'][index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
