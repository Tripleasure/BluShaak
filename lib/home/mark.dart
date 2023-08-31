import 'package:flutter/material.dart';

import '../utils/colorList.dart';

class MarkPage extends StatelessWidget {
  const MarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text('즐겨찾기',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorList.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '검색',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/magok3.png',
                scale: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
