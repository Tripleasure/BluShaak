import 'package:blushaakk/bottom.dart';
import 'package:flutter/material.dart';

class NonPhone extends StatelessWidget {
  const NonPhone({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/nonphone.png',
              scale: 2,
            )),
      ),
    );
  }
}
