import 'package:blushaakk/gift/gift.dart';
import 'package:blushaakk/home/around.dart';
import 'package:blushaakk/home/home.dart';
import 'package:blushaakk/home/mark.dart';
import 'package:blushaakk/home/recent.dart';
import 'package:blushaakk/more/more.dart';
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
    Container(),
    const GiftPage(),
    const MorePage()
  ];

  final GlobalKey fabKey = GlobalKey();
  OverlayEntry? overlayEntry;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void showOverlay(BuildContext context) {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
      return;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    overlayEntry = OverlayEntry(
        builder: (context) => Stack(
              children: [
                // Dark background
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => showOverlay(context),
                    child: Container(
                      color:
                          Colors.black.withOpacity(0.7), // Adjust opacity here
                    ),
                  ),
                ),
                // Overlay content
                Positioned(
                  left: (screenWidth * 0.1),
                  bottom: screenHeight * 0.12, // You can adjust this as needed
                  width: screenWidth * 0.8,
                  height: 200,
                  child: Material(
                    color: Colors.transparent,
                    child: CustomTooltip(
                      message: 'This is tooltip!',
                      showOverlay: () => showOverlay(context),
                    ),
                  ),
                ),
              ],
            ));

    Overlay.of(context).insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorList.primary,
          key: fabKey,
          onPressed: () => showOverlay(context),
          child: Image.asset('assets/images/coffee.png', scale: 2)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontSize: 12), // 글자 크기를 고정
          unselectedLabelStyle: const TextStyle(fontSize: 12), // 글자 크기를 고정
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          unselectedItemColor: const Color(0xffADADAD),
          selectedItemColor: ColorList.primary,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.receipt), label: '주문내역'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
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

class CustomTooltip extends StatelessWidget {
  final String message;
  final Function showOverlay;
  const CustomTooltip(
      {super.key, required this.message, required this.showOverlay});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TooltipPainter(),
      child: Column(
        children: [
          InkWell(
            onTap: () => showOverlay(),
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
            ),
          ),
          const Text(
            '주문하기',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecentPage(),
                    ),
                  );

                  showOverlay();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/order1.png',
                        scale: 2.5,
                      ),
                      const Text(
                        '최근 방문',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Around(),
                    ),
                  );
                  showOverlay();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/order2.png',
                        scale: 2.5,
                      ),
                      const Text(
                        '내 주변',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MarkPage(),
                    ),
                  );

                  showOverlay();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/order3.png',
                        scale: 2.5,
                      ),
                      const Text(
                        '즐겨찾기',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TooltipPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    const double radius = 12;

    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius),
          radius: const Radius.circular(radius))
      ..lineTo(size.width, size.height - 10 - radius)
      ..arcToPoint(Offset(size.width - radius, size.height - 10),
          radius: const Radius.circular(radius))
      ..lineTo(size.width / 2 + 10, size.height - 10)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width / 2 - 10, size.height - 10)
      ..lineTo(radius, size.height - 10)
      ..arcToPoint(Offset(0, size.height - 10 - radius),
          radius: const Radius.circular(radius))
      ..lineTo(0, radius)
      ..arcToPoint(const Offset(radius, 0),
          radius: const Radius.circular(radius))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
