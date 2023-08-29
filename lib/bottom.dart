import 'package:blushaakk/home/home.dart';
import 'package:blushaakk/order/order.dart';
import 'package:blushaakk/utils/colorList.dart';
import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  _CommonBottomNavigationBarState createState() =>
      _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const OrderPage(),
    const Center(child: Text('Bookmark')),
    const Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorList.primary,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          unselectedItemColor: const Color(0xffADADAD),
          selectedItemColor: ColorList.primary,
          type: BottomNavigationBarType.fixed,
          // 네비게이션 바의 설정을 작성
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.receipt), label: '주문내역'),
            BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.redeem), label: '선물하기'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: '더보기'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
