import 'package:flutter/material.dart';

class Noti extends StatelessWidget {
  const Noti({super.key});

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
        title: const Text('공지사항',
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
              child: Image.asset(
                'assets/images/noti.png',
                scale: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
