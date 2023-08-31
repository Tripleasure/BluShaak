import 'package:flutter/material.dart';

import '../utils/colorList.dart';

class Around extends StatefulWidget {
  const Around({super.key});

  @override
  State<Around> createState() => _AroundState();
}

class _AroundState extends State<Around> {
  void showBottomSheetWithCheckbox(BuildContext context) {
    bool a = false;
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
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/bar.png')),
                      Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    a = !a;
                                  },
                                );
                              },
                              child: a == false
                                  ? Image.asset('assets/images/magok.png')
                                  : Image.asset('assets/images/magok3.png'))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              showBottomSheet2(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: ColorList.primary)),
                              child: Text(
                                '매장정보',
                                style: TextStyle(color: ColorList.primary),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            decoration: BoxDecoration(
                                color: ColorList.primary,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: ColorList.primary)),
                            child: const Text(
                              '주문하기',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ]));
          },
        );
      },
    );
  }

  void showBottomSheet2(BuildContext context) {
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
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Image.asset(
                          'assets/images/magok2.png',
                          scale: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: ColorList.primary)),
                              child: Text(
                                '닫기',
                                style: TextStyle(color: ColorList.primary),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            decoration: BoxDecoration(
                                color: ColorList.primary,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: ColorList.primary)),
                            child: const Text(
                              '주문하기',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ]));
          },
        );
      },
    );
  }

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
        title: const Text('최근 방문',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorList.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '검색',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showBottomSheetWithCheckbox(context);
                },
                child: Image.asset(
                  'assets/images/map.png',
                  scale: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
