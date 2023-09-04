import 'package:flutter/material.dart';

class Even extends StatelessWidget {
  const Even({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
        title: const Text('이벤트',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 50, top: 30),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/even.png',
                    scale: 2,
                  ),
                  Image.asset(
                    'assets/images/even.png',
                    scale: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
