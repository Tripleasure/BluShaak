import 'package:flutter/material.dart';

class Qna extends StatelessWidget {
  const Qna({super.key});

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
        title: const Text('자주 묻는 질문',
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
                  "Q.쿠폰은 어떻게 쓸 수 있나요?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                children: <Widget>[
                  Image.asset(
                    'assets/images/qna.png',
                    scale: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]),
            ExpansionTile(
                title: const Text(
                  "Q.스탬프를 방금 받았는데 뜨지 않습니다",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                children: <Widget>[
                  Image.asset(
                    'assets/images/qna.png',
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
