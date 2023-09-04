import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  bool a = false;
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      a == false
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  a = !a;
                                });
                              },
                              child: Image.asset(
                                'assets/images/magok.png',
                                scale: 2,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  a = !a;
                                });
                              },
                              child: Image.asset(
                                'assets/images/magok3.png',
                                scale: 2,
                              ),
                            ),
                      const SizedBox(
                        height: 25,
                      ),
                      Image.asset(
                        'assets/images/recent.png',
                        scale: 2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
