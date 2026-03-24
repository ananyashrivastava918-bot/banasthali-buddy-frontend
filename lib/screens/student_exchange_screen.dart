import 'package:flutter/material.dart';
import 'buy_item_screen.dart';
import 'post_item_screen.dart';

class StudentExchangeHome extends StatelessWidget {
  const StudentExchangeHome({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [

          /// 🔵 TOP GRADIENT HEADER
          Container(
            height: height * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2F6F6D),
                  Color(0xFF4A9C97),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// BACK BUTTON
                  IconButton(
                    icon: const Icon(Icons.arrow_back,color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      "Student Exchange Hub",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔵 WHITE SECTION
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.75,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: const Color(0xFFE6F4F1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 15,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),

              child: Stack(
                children: [

                  /// 🔵 ARROW BACKGROUND IMAGE
                  Center(
                    child: Opacity(
                      opacity: 0.14,
                      child: Image.asset(
                        "assets/images/exchange_arrow.png",
                        width: 800,
                      ),
                    ),
                  ),

                  /// 🔵 BUY BUTTON (upper arrow)
                  Align(
                    alignment: const Alignment(0,-0.2),
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F6F6D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        icon: const Icon(Icons.shopping_bag),
                        label: const Text(
                          "Buy Items",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BuyItemScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  /// 🔵 SELL BUTTON (lower arrow)
                  Align(
                    alignment: const Alignment(0,0.35),
                    child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A9C97),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        icon: const Icon(Icons.sell),
                        label: const Text(
                          "Sell Items",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PostItemScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}