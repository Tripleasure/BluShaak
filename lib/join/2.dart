import 'package:blushaakk/join/phone.dart';
import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';

import 'dropdown.dart';
import 'num.dart';

class Join2 extends StatefulWidget {
  const Join2({super.key});

  @override
  State<Join2> createState() => _Join2State();
}

class _Join2State extends State<Join2> {
  bool a = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '회원가입',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                width: width,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          a = !a;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        alignment: Alignment.center,
                        width: width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '본인확인 서비스 전체 동의',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              a == false
                                  ? Image.asset(
                                      'assets/images/noncheck.png',
                                      scale: 2,
                                    )
                                  : Image.asset(
                                      'assets/images/check.png',
                                      scale: 2,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '사용자 이름',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          const TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(), // 언더라인만 표시
                              labelText: '이름입력',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '주민등록번호',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          SocialSecurityFields(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '휴대폰 정보',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: const CarrierDropdown()),
                                  const PhoneNumberValidation(),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            width: width * 0.9,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorList.primary,
            ),
            child: const Text(
              '회원가입하기',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
