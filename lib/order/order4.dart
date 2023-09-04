import 'package:flutter/material.dart';

import '../bottom.dart';
import '../utils/colorList.dart';

class Order4Page extends StatefulWidget {
  const Order4Page({super.key});

  @override
  State<Order4Page> createState() => _Order4PageState();
}

class _Order4PageState extends State<Order4Page> {
  List<Map<String, dynamic>> items = [
    {
      'name': '샥 라떼',
      'count': 1,
      'price': 2000,
      'description': 'Ice/샷추가',
      'image': 'americano.jpg'
    },
    {
      'name': '피넛 라떼',
      'count': 1,
      'price': 2000,
      'description': 'Ice',
      'image': 'latte.jpg'
    },
    {
      'name': '아메리카노',
      'count': 1,
      'price': 2000,
      'description': 'Hot/샷추가',
      'image': 'mocha.jpg'
    },
  ];
  int getTotalPrice() {
    int total = 0;
    for (var item in items) {
      total += (item['price'] as int) * (item['count'] as int);
    }
    return total;
  }

  int? selectedRadio;
  int? selectedValue;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
        int? localSelectedRadio = selectedRadio;
        return StatefulBuilder(
          builder: (context, setState) {
            height:
            MediaQuery.of(context).size.height;
            width:
            MediaQuery.of(context).size.width;

            return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
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
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          '메세지 입력',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextField(
                                          decoration: InputDecoration(
                                        hintText: '메세지 입력',
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorList
                                                  .primary // 여기서 사용자가 원하는 색깔로 바꿀 수 있습니다.
                                              ),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey, // 초기 밑줄 색깔
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          '보내는 사람',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      TextField(
                                          decoration: InputDecoration(
                                        hintText: '보내시는 분의 이름을 입력해주세요',
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorList
                                                  .primary // 여기서 사용자가 원하는 색깔로 바꿀 수 있습니다.
                                              ),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey, // 초기 밑줄 색깔
                                          ),
                                        ),
                                      )),
                                      TextField(
                                          decoration: InputDecoration(
                                        hintText: '보내시는 분의 전화번호를 입력해주세요',
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorList
                                                  .primary // 여기서 사용자가 원하는 색깔로 바꿀 수 있습니다.
                                              ),
                                        ),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey, // 초기 밑줄 색깔
                                          ),
                                        ),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            '받는사람',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '연락처 추가',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('나에게 선물하기'),
                                          Checkbox(
                                            value: selectedValue == 1,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue =
                                                    (value == true) ? 1 : null;
                                              });
                                            },
                                            activeColor: ColorList.primary,
                                            checkColor: Colors.transparent,
                                            shape: const CircleBorder(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          '결제수단',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('신용카드'),
                                          Radio(
                                              value: 1,
                                              groupValue:
                                                  localSelectedRadio, // 지역 변수 사용
                                              activeColor: ColorList.primary,
                                              onChanged: (val) {
                                                print("Radio $val");
                                                setState(() {
                                                  // 지역 setState 사용
                                                  localSelectedRadio = val;
                                                });
                                              }),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('페이코'),
                                          Radio(
                                              value: 2,
                                              groupValue:
                                                  localSelectedRadio, // 지역 변수 사용
                                              activeColor: ColorList.primary,
                                              onChanged: (val) {
                                                print("Radio $val");
                                                setState(() {
                                                  // 지역 setState 사용
                                                  localSelectedRadio = val;
                                                });
                                              }),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('휴대폰 결제'),
                                          Radio(
                                              value: 3,
                                              groupValue:
                                                  localSelectedRadio, // 지역 변수 사용
                                              activeColor: ColorList.primary,
                                              onChanged: (val) {
                                                print("Radio $val");
                                                setState(() {
                                                  // 지역 setState 사용
                                                  localSelectedRadio = val;
                                                });
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const ExpansionTile(
                                    title: Text(
                                      "선물하기 유의사항",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                          title: Text(
                                        '선물하기 유의사항입니다.선물하기 유의사항입니다.선물하기 유의사항입니다.선물하기 유의사항입니다.선물하기 유의사항입니다.선물하기 유의사항입니다.선물하기 유의사항입니다.선물하기 유의사항입니다.',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      )),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CommonBottomNavigationBar()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorList.primary,
                        ),
                        child: const Text(
                          '주문하기',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ));
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
        actions: const [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.redeem,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: const Text('장바구니',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(items[index]['name']),
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete),
                          ),
                          onDismissed: (direction) {
                            String itemName = items[index]['name'];
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("$itemName removed")));

                            setState(() {
                              items.removeAt(index);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 100, // Container 높이를 증가시켰습니다.
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                        "assets/images/menu${index + 1}.jpeg"), // 이미지 파일 경로
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(items[index]['name']),
                                        Text(
                                          "${items[index]['description']}",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${items[index]['price'] * items[index]['count']} 원",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .end, // 이 부분이 바뀌었습니다. 여기서 밑으로 정렬이 됩니다.
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10, right: 20),
                                        child: Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (items[index]['count'] >
                                                        1) {
                                                      items[index]['count']--;
                                                    }
                                                  });
                                                },
                                                child: Image.asset(
                                                  'assets/images/minus.png',
                                                  scale: 2,
                                                )),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10, left: 10),
                                                child: Text(
                                                    '${items[index]['count']}')),
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    items[index]['count']++;
                                                  });
                                                },
                                                child: Image.asset(
                                                  'assets/images/plus.png',
                                                  scale: 2,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '할인 쿠폰',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '쿠폰을 선택해주세요',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '총 금액',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                '주문하기',
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
