import 'package:flutter/material.dart';
import 'home_screen.dart'; // 🔹 ADD THIS
// existing imports remain same

class BuyItemScreen extends StatefulWidget {
  const BuyItemScreen({super.key});

  @override
  State<BuyItemScreen> createState() => _BuyItemScreenState();
}

class _BuyItemScreenState extends State<BuyItemScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> items = [
    {
      "name": "Study Table",
      "price": "₹1200",
      "description": "Good condition wooden table",
      "hostel": "Apaji Hostel",
      "contact": "9876543210",
      "image": "",
    },
    {
      "name": "Cycle",
      "price": "₹2500",
      "description": "Used cycle, smooth condition",
      "hostel": "Gandhi Hostel",
      "contact": "9123456780",
      "image": "",
    },
  ];

  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void searchItem(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
          item["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F6F6D),
        title: const Text("Buy Items"),
        centerTitle: true,

        /// 🔹 NEW HOME BUTTON
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeScreen(),
                ),
                    (route) => false,
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔍 Search Bar
            TextField(
              controller: _searchController,
              onChanged: searchItem,
              decoration: InputDecoration(
                hintText: "Search items...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 📦 Item Listings
            Expanded(
              child: filteredItems.isEmpty
                  ? const Center(child: Text("No items found"))
                  : ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];

                  return Container(
                    margin:
                    const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Row(
                      children: [

                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(12),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: const Color(0xFFCDEAE4),
                            child: const Icon(
                              Icons.image,
                              color: Color(0xFF2F6F6D),
                            ),
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"]!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item["description"]!,
                                style: const TextStyle(
                                    color: Colors.black54),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Price: ${item["price"]}",
                                style: const TextStyle(
                                    fontWeight:
                                    FontWeight.w600),
                              ),
                            ],
                          ),
                        ),

                        ElevatedButton(
                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xFF2F6F6D),
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  AlertDialog(
                                    title: const Text(
                                        "Seller Details"),
                                    content: Column(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                            "Hostel: ${item["hostel"]}"),
                                        const SizedBox(
                                            height: 8),
                                        Text(
                                            "Contact Number: ${item["contact"]}"),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(
                                                context),
                                        child:
                                        const Text("Close"),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          child:
                          const Text("Contact"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
