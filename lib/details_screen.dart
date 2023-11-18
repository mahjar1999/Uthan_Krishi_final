import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String category;
  final Map<String, dynamic> subcategory;

  DetailsScreen({required this.category, required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${subcategory['name']}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF285429),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF285429),
      body:  Column(
        children: [
          // Fixed-positioned image with a fixed height
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Set your desired radius
              child: Image.asset(
                subcategory['logo'],
                height: 200,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Scrollable details section
          Expanded(
            child: SingleChildScrollView(
              child: Card(
                elevation: 4,
                color: Colors.white,
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description text
                      buildDescriptionWithLineSpacing(subcategory['description']),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDescriptionWithLineSpacing(dynamic description) {
    if (description is String) {
      return buildTextWidget(description);
    } else if (description is List<Map<String, dynamic>>) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: description
            .map((item) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['title'],
              style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            buildTextWidget(item['data']),
            SizedBox(height: 16.0),
          ],
        ))
            .toList(),
      );
    }

    return Container(); // Handle other types of descriptions if needed
  }

  Widget buildTextWidget(String text) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 18.0, color: Colors.black),
        children: text.split('\n').map((line) {
          return TextSpan(
            text: '$line\n',
          );
        }).toList(),
      ),
    );
  }
}
