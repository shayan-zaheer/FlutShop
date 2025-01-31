import "package:flutshop/pages/cart_page.dart";
import "package:flutshop/widgets/product_list.dart";
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ), // scrolled position is maintained by IndexedStack
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        onTap: (pageNum){
            setState((){
                currentPage = pageNum;
            });
        },
        currentIndex: currentPage,
        items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart"
            )
        ],
      ),
    );
  }
}
