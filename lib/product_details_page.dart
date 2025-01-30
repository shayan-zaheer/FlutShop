import "package:flutshop/cart_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
    int selectedSize = 0;

    void onTap() {
        if(selectedSize != 0){
            Provider.of<CartProvider>(context, listen: false).addProduct({
            'id': widget.product["id"],
            'title': widget.product["title"],
            'price': widget.product["price"],
            'imageUrl': widget.product["imageUrl"],
            'company': widget.product["company"],
            'size': selectedSize,
        }); // using provider, we always use <> with the class of the provider. listen shoud be set to false everytime we have to call a function from any provider
    } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Please select a size!",
                ),
            ),
        ); // it uses context to keep track of the page on which it wants to show the snackbar
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                widget.product["title"].toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Spacer(), // spacer is used for relative spacing (flex)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(widget.product["imageUrl"].toString()),
            ),
            const Spacer(flex: 2),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 1),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\$${widget.product["price"].toString()}",
                      style: Theme.of(context).textTheme.titleLarge),
                  Row(
                    children: (widget.product["sizes"] as List).map((size) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: (){
                                setState((){
                                    selectedSize = size;
                                });
                            },
                          child: Chip(
                              label: Text("$size"),
                              backgroundColor: selectedSize == size ? Theme.of(context).colorScheme.primary : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  FilledButton.icon(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.black,
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    label: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
