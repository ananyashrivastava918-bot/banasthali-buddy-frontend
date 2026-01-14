import 'package:flutter/material.dart';
import 'item_detail_screen.dart';
import '../../models/item_model.dart';

class ItemsListScreen extends StatelessWidget {
  const ItemsListScreen({super.key});

  // Dummy data
  final List<ItemModel> dummyItems = const [
    ItemModel(
      id: "1",
      name: "Old Textbook",
      description: "Used textbook for semester 3",
      price: 200,
      category: "Books",
      sellerName: "Alice",
    ),
    ItemModel(
      id: "2",
      name: "Laptop Bag",
      description: "Slightly used backpack",
      price: 500,
      category: "Accessories",
      sellerName: "Bob",
    ),
    ItemModel(
      id: "3",
      name: "Mathematics Notes",
      description: "Complete set of notes for semester 2",
      price: 100,
      category: "Notes",
      sellerName: "Charlie",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Items List")),
      body: ListView.builder(
        itemCount: dummyItems.length,
        itemBuilder: (context, index) {
          final item = dummyItems[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(item.name),
              subtitle: Text("${item.category} • ₹${item.price}"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ItemDetailScreen(item: item)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
