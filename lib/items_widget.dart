import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'cart_page.dart';
import 'constantss.dart';
import 'single_item.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({
    super.key,
    required this.id,
    required this.category,
  });
  final String id;
  final String category;

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

List img = [
  'Capuccino',
  'Latte',
  'Americano',
  'Mocha',
  'Capuccino',
  'Latte',
  'Americano',
  'Mocha',
];

class _ItemsWidgetState extends State<ItemsWidget> {
  final PageController pageController = PageController();
  final _cartBox = Hive.box('cart_box');
  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
    getCarts();
  }

  getCarts() {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);

      return {
        "key": key,
        "id": item["id"],
      };
    }).toList();

    carts = cartData.toList();
    idss = carts.map((item) => item['id']).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF212325),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleItemScreen(img[i])));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/${img[i]}.jpg",
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          img[i],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.category,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ 7",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFFE57734),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            onTap: () async {
                              if (idss.contains(widget.id)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartPage()));
                              } else {
                                _createCart({
                                  "id": widget.id,
                                  "category": widget.category,
                                });
                              }
                            },
                            child: idss.contains(widget.id)
                                ? const Icon(
                                    Icons.minimize,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
