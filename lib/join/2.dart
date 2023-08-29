import 'package:blushaakk/home/home.dart';
import 'package:blushaakk/join/phone.dart';
import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';

import '../bottom.dart';
import 'dropdown.dart';
import 'num.dart';

class Join2 extends StatefulWidget {
  const Join2({super.key});

  @override
  State<Join2> createState() => _Join2State();
}

void showBottomSheetWithCheckbox(BuildContext context) {
  bool isChecked1 = false; // 체크박스 상태를 저장하는 변수
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      // <-- 둥근 모서리를 위한 설정
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          height:
          MediaQuery.of(context).size.height;
          width:
          MediaQuery.of(context).size.width;

          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/images/bar.png')),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '약관 동의',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        isChecked1 = !isChecked1;
                        setState(() {
                          isChecked1 = true;
                          isChecked2 = true;
                          isChecked3 = true;
                          isChecked4 = true;
                          if (isChecked1 == false) {
                            isChecked1 = false;
                            isChecked2 = false;
                            isChecked3 = false;
                            isChecked4 = false;
                          }
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                isChecked1 &
                                        isChecked2 &
                                        isChecked3 &
                                        isChecked4
                                    ? Image.asset(
                                        'assets/images/check.png',
                                        scale: 2,
                                      )
                                    : Image.asset(
                                        'assets/images/noncheck.png',
                                        scale: 2,
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  '모두 동의',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '서비스 사용을 위해 아래 세부 약관 내용에 전부 동의합니다.',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            color: ColorList.grey,
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked2 = !isChecked2;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                isChecked2
                                    ? Image.asset(
                                        'assets/images/check.png',
                                        scale: 2,
                                      )
                                    : Image.asset(
                                        'assets/images/noncheck.png',
                                        scale: 2,
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      '서비스 이용약관 동의(필수)',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '자세히 보기',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '제품의 사용 조건과 서비스 이용 절차 등에 관한 사항을 규정하고 그 내용을 고지합니다',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            color: ColorList.grey,
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked3 = !isChecked3;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                isChecked3
                                    ? Image.asset(
                                        'assets/images/check.png',
                                        scale: 2,
                                      )
                                    : Image.asset(
                                        'assets/images/noncheck.png',
                                        scale: 2,
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      '고유식별 정보처리 동의(필수)',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '자세히 보기',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '주민등록번호 등 이용자의 고유식별정보를 서비스에서 수집 또는 사용하기 위해 동의를 받습니다',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            color: ColorList.grey,
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked4 = !isChecked4;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                isChecked4
                                    ? Image.asset(
                                        'assets/images/check.png',
                                        scale: 2,
                                      )
                                    : Image.asset(
                                        'assets/images/noncheck.png',
                                        scale: 2,
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      '개인정보 수집 및 이용동의',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '자세히 보기',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              '회사가 서비스 이용자의 개인정보를 수집 또는 이용하기 위해 개인정보를 사용에 대한 동의를 받습니다',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            color: ColorList.grey,
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (isChecked2 & isChecked3) {
                      // 조건을 충족하는 경우에만 버튼이 작동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CommonBottomNavigationBar()),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorList.primary,
                    ),
                    child: const Text(
                      '회원가입하기',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
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
          InkWell(
            onTap: () {
              showBottomSheetWithCheckbox(context);
            },
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}
