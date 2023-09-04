import 'package:blushaakk/home/couponList.dart';
import 'package:blushaakk/home/stampList.dart';
import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';

class Stamp extends StatelessWidget {
  const Stamp({super.key});

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
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.restart_alt, color: Colors.black)),
        ],
        title: const Text('스탬프',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  width: width * 0.9,
                  child: Image.asset('assets/images/stamp.png')),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StampList(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          '내 스탬프 적립 내역',
                          style: TextStyle(
                              color: ColorList.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CouponList(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          '내 쿠폰',
                          style: TextStyle(
                              color: ColorList.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  children: List.generate(
                      60,
                      (index) => index.isEven
                          ? Container(width: 5, height: 1, color: Colors.black)
                          : const SizedBox(width: 5)),
                ),
              ),
              const SizedBox(height: 30),
              ExpansionTile(
                title: const Text("스탬프 및 쿠폰 유의사항"),
                children: <Widget>[
                  ListTile(
                    title: Image.asset('assets/images/ex.png'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
