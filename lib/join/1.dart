import 'package:blushaakk/join/2.dart';
import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';

class Join1 extends StatelessWidget {
  const Join1({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/main2.png',
                      scale: 2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      '지금부터\n시작해볼까요?',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Join2(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      alignment: Alignment.center,
                      width: width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: ColorList.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        '회원가입하기',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('이미 계정이 있나요? '),
                      Text(
                        '로그인하기',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
