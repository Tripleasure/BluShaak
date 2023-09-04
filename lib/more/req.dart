import 'package:flutter/material.dart';

import '../utils/colorList.dart';

class Req extends StatelessWidget {
  const Req({super.key});

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
        title: const Text('1:1문의',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ExpansionTile(
                title: const Text(
                  "문의하기",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '문의 제목',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: '메세지를 입력해주세요.', // 힌트 텍스트
                        hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 스타일
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, // 밑줄의 기본 색상
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '문의 제목',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: '메세지를 입력해주세요.', // 힌트 텍스트
                        hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 스타일
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, // 밑줄의 기본 색상
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 30,
                      ),
                      alignment: Alignment.center,
                      width: width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorList.primary,
                      ),
                      child: const Text(
                        '문의하기',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
            ExpansionTile(
                title: const Text(
                  "문의내역",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                children: <Widget>[
                  Image.asset(
                    'assets/images/req.png',
                    scale: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ])
          ],
        ),
      ),
    );
  }
}
