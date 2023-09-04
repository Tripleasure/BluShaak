import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colorList.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  void _selectDate(BuildContext context, {required bool isStart}) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 200,
        color: CupertinoColors.white,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        a = false;
                        b = false;
                      });
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() {
                    if (isStart) {
                      selectedStartDate = newDateTime;
                    } else {
                      selectedEndDate = newDateTime;
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  int selectedIndex = -1;
  bool a = false;
  bool b = false;
  @override
  Widget build(BuildContext context) {
    List<String> options = ["오늘", "일주일", "1개월", "3개월", "전체"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: null,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          '주문내역',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
                      margin: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 4, right: 4),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    _selectDate(context, isStart: true);
                    setState(() {
                      a = !a;
                    });
                  },
                  child: Text(
                    selectedStartDate.toString().substring(0, 10),
                    style:
                        TextStyle(color: a ? ColorList.primary : Colors.grey),
                  ),
                ),
                const Text(
                  '  -  ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    _selectDate(context, isStart: false);
                    setState(() {
                      b = !b;
                    });
                  },
                  child: Text(
                    selectedEndDate.toString().substring(0, 10),
                    style: TextStyle(
                      color: b ? ColorList.primary : Colors.grey,
                    ),
                  ),
                ),
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: const Text(
                    '주문 내역이 없습니다',
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
