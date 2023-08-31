import 'package:blushaakk/gift/cart.dart';
import 'package:flutter/material.dart';

import '../utils/colorList.dart';

class MenusPage extends StatefulWidget {
  const MenusPage({super.key});

  @override
  State<MenusPage> createState() => _MenusPageState();
}

List<String> names2 = ['Coffee', 'Baverage', 'Blended', 'Bakery', 'Ice-cream'];
int selectedIndex = -1;

class _MenusPageState extends State<MenusPage> {
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
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
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
        title: const Text('최근 방문',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60, // ListView의 높이를 설정해 줄 수 있습니다.
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: names2.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? ColorList.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          border: selectedIndex == index
                              ? null
                              : Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          names2[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
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
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                child: Image.asset(
                  'assets/images/menus.png',
                  scale: 2,
                ),
              ),
              Image.asset(
                'assets/images/menus.png',
                scale: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
