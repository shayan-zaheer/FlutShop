import "package:flutter/material.dart";

class ProductCard extends StatelessWidget {
    final String title;
    final double price;
    final String image;
    final Color color;

    const ProductCard({super.key, required this.title, required this.price, required this.image, required this.color});

    @override
    Widget build(BuildContext context){
        return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color,
            ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(title, style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 5),
                    Text("\$$price", style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: 5),
                    Center(child: Image.asset(image, height: 175)),
                ],
            )
        );
    }
}