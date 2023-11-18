import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uthan_krishi/description.dart';
import 'package:uthan_krishi/subcategory_screen.dart';

import 'details_screen.dart';
import 'grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF285429),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: SizedBox(
                height: 40,
                child: Text('Welcome to উঠান-কৃষি',style: TextStyle(fontSize: 18,color: Colors.white),),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return GridItem(
                    category: categoryList[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubcategoryScreen(category: categoryList[index])),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
