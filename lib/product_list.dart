import "package:flutshop/global_variables.dart";
import "package:flutshop/product_card.dart";
import "package:flutshop/product_details_page.dart";
import "package:flutter/material.dart";

class ProductList extends StatefulWidget {
    const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
      final List<String> filters = const ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilter;

    @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

    @override
    Widget build(BuildContext context){
        const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(32),
      ),
    );

        return SafeArea(
        // avoids the notch at the top or bottom
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  // take as much space as possible
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : Color.fromRGBO(245, 247, 249,
                                  1), // Theme.of(context) works in inheritance, it goes up in parent widgets until it finds a nearest themewidget (MaterialApp)
                          labelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          label: Text(filter),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product["title"] as String,
                        price: product["price"] as double,
                        image: product["imageUrl"] as String,
                        color: index % 2 == 0
                            ? Color.fromRGBO(216, 240, 253, 1)
                            : Color.fromRGBO(225, 225, 225, 1),
                      ),
                    );
                  }),
            )
          ],
        ),
      );
    }
}