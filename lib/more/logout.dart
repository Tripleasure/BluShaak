import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

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
        title: const Text('로그아웃',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        height: height,
        width: width,
        child: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Image.asset(
              'assets/images/logout.png',
              scale: 2,
            ),
          ),
        ),
      ),
    );
  }
}
