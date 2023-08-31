import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Americano',
      'count': 1,
      'price': 5,
      'description': 'Hot Coffee',
      'image': 'americano.jpg'
    },
    {
      'name': 'Latte',
      'count': 1,
      'price': 6,
      'description': 'Milk Coffee',
      'image': 'latte.jpg'
    },
    {
      'name': 'Mocha',
      'count': 1,
      'price': 7,
      'description': 'Chocolate Coffee',
      'image': 'mocha.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("$itemName removed")));

              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/images/menu${index + 1}.jpeg"), // 이미지 파일 경로
              ),
              title: Text(items[index]['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description: ${items[index]['description']}"),
                  Text(
                      "Total: \$${items[index]['price'] * items[index]['count']}"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (items[index]['count'] > 1) {
                          items[index]['count']--;
                        }
                      });
                    },
                  ),
                  Text('${items[index]['count']}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        items[index]['count']++;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
