import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';

class StampList extends StatefulWidget {
  const StampList({super.key});

  @override
  State<StampList> createState() => _StampListState();
}

class _StampListState extends State<StampList> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> options = ["오늘", "일주일", "1개월", "3개월", "전체"];
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
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.restart_alt, color: Colors.black)),
        ],
        title: const Text('스탬프 적립 내역',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 60, // ListView의 높이를 설정해 줄 수 있습니다.
              child: ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10.0),
                      height: 50,
                      width: 70,
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
                        options[index],
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
            // 다른 위젯들...
            Expanded(
              child: Center(
                child: Container(
                  child: const Text(
                    '적립 내역이 없습니다',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
