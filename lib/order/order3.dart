import 'package:blushaakk/order/order4.dart';
import 'package:flutter/material.dart';

import '../utils/colorList.dart';

class Order3Page extends StatefulWidget {
  const Order3Page({super.key});

  @override
  State<Order3Page> createState() => _Order3PageState();
}

class _Order3PageState extends State<Order3Page> {
  List<Map<String, dynamic>> items = [
    {
      'name': '아메리카노',
      'count': 1,
      'price': 2000,
      'description': '블루샥 만의 스페셜티 원두로 3가지 스타일의 아메리카노',
      'image': 'americano.jpg'
    },
  ];

  int getTotalPrice() {
    int total = 0;
    for (var item in items) {
      total += (item['price'] as int) * (item['count'] as int);
    }
    return total;
  }

  String temperature = 'Ice';
  String shotOption = 'None';
  String tumblerOption = 'None';
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
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Order4Page(),
                ),
              );
            },
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.redeem,
            color: Colors.black,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          )
        ],
        title: const Text('메뉴 상세',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        "assets/images/menu3.jpeg",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: const Text(
                        '아메리카노',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const Text(
                      '블루샥 만의 스페셜티 원두로 3가지 스타일의 아메리카노',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                if (items[0]['count'] > 1) {
                                  // index를 0으로 변경
                                  items[0]['count']--;
                                }
                              });
                            },
                            child: Image.asset(
                              'assets/images/minus.png',
                              scale: 1.5,
                            )),
                        Container(
                          margin: const EdgeInsets.only(right: 30, left: 30),
                          child: Text(
                            '${items[0]['count']}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ), // index를 0으로 변경
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                items[0]['count']++; // index를 0으로 변경
                              });
                            },
                            child: Image.asset(
                              'assets/images/plus.png',
                              scale: 1.5,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ExpansionTile(
                      title: const Text(
                        "퍼스널 옵션",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'ICE/HOT',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('ICE'),
                                  Radio<String>(
                                    value: 'Ice',
                                    groupValue: temperature,
                                    onChanged: (String? value) {
                                      setState(() {
                                        temperature = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Hot'),
                                  Radio<String>(
                                    value: 'Hot',
                                    groupValue: temperature,
                                    onChanged: (String? value) {
                                      setState(() {
                                        temperature = value!;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  '샷 추가',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('선택 안 함'),
                                  Radio<String>(
                                    value: 'None',
                                    groupValue: shotOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        shotOption = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('샷 추가(+ 500)'),
                                  Radio<String>(
                                    value: 'Shot',
                                    groupValue: shotOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        shotOption = value!;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  '개인 텀블러 사용',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('선택 안 함'),
                                  Radio<String>(
                                    value: 'None',
                                    groupValue: tumblerOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        tumblerOption = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('텀블러(개인컵),사용'),
                                  Radio<String>(
                                    value: 'Hot',
                                    groupValue: tumblerOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        tumblerOption = value!;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '총 금액',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${getTotalPrice()} 원',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Order4Page()),
                    );
                  },
                  child: Container(
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
