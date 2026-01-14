import 'package:flutter/material.dart';
import '../../models/item_model.dart';

class ItemDetailScreen extends StatelessWidget {
  final ItemModel item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.grey.shade300,
              child: const Center(child: Icon(Icons.image, size: 80)),
            ),
            const SizedBox(height: 16),
            Text(item.name,
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(item.description),
            const SizedBox(height: 8),
            Text("Category: ${item.category}"),
            const SizedBox(height: 8),
            Text("Price: ₹${item.price}"),
            const SizedBox(height: 8),
            Text("Seller: ${item.sellerName}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Contact Seller feature coming soon")),
                );
              },
              child: const Text("Contact Seller"),
            ),
          ],
        ),
      ),
    );
  }
}
