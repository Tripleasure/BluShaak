import 'package:blushaakk/gift/cart.dart';
import 'package:blushaakk/gift/menus.dart';
import 'package:flutter/material.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({super.key});

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  List<String> names2 = [
    'Coffee',
    'Baverage',
    'Blended',
    'Bakery',
    'Ice-cream'
  ];
  List<String> names = ['샥 라떼', '피넛 라떼', '아메리카노', '카페 라떼', '바닐라 빈 라떼'];
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
        leading: null,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
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
        title: const Text('선물 하기',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset('assets/images/gift.png'),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '카테고리',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: names2.length, // 리스트의 길이만큼 아이템 생성
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                "assets/images/cate${index + 1}.jpeg",
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              names2[index], // 리스트에서 이름을 가져옴
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '인기상품',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenusPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: names.length, // 리스트의 길이만큼 아이템 생성
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage(
                                  "assets/images/menu${index + 1}.jpeg"),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              names[index], // 리스트에서 이름을 가져옴
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '기프트 카드',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // 원하는 이미지의 수
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          "assets/images/giftcard.png",
                          scale: 1.5,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
