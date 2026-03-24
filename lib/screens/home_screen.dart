import 'package:flutter/material.dart';
import 'student_exchange_screen.dart';
import 'erickshaw_booking_screen.dart';
import 'bus_tracking_screen.dart';
import '../services/booking_service.dart';
import 'settings_screen.dart';
import 'package:animated_background/animated_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {

  Widget buildSection({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          splashColor: Colors.white24,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            children: [

              /// LEFT CIRCLE IMAGE
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 8,
                      offset: const Offset(0,4),
                    )
                  ],
                ),
              ),

              const SizedBox(width: 20),

              /// GREEN BUTTON
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,

                  constraints: const BoxConstraints(
                    minHeight: 55,
                    maxHeight: 70,
                  ),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFF2F6F6D),
                    borderRadius: BorderRadius.circular(20),

                    /// FLOATING SHADOW
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0,4),
                      )
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// TEXT
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      /// ARROW ICON
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [

          /// ANIMATED HEADER
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
                baseColor: Colors.white,
                spawnOpacity: 0.08,
                opacityChangeRate: 0.25,
                minOpacity: 0.05,
                maxOpacity: 0.12,
                spawnMinSpeed: 10,
                spawnMaxSpeed: 20,
                particleCount: 18,
              ),
            ),
            vsync: this,
            child: Container(
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

              child: Stack(
                children: [

                  /// BACKGROUND IMAGE
                  Opacity(
                    opacity: 0.25,
                    child: Image.asset(
                      "assets/images/bg.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),

                  /// HEADER CONTENT
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const SettingsScreen(role: "student"),
                              ),
                            );
                          },
                        ),

                        const Text(
                          "Student Home Screen",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /// WHITE AREA
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.75,
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
                    offset: const Offset(0,-5),
                  ),
                ],
              ),

              child: Column(
                children: [

                  buildSection(
                    context: context,
                    title: "Student Exchange Hub",
                    subtitle: "Buy & sell items among students",
                    imagePath: "assets/images/exchange.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StudentExchangeHome(),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  buildSection(
                    context: context,
                    title: "Bus Tracking",
                    subtitle: "Track campus buses in real time",
                    imagePath: "assets/images/bus.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BusTrackingScreen(),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  buildSection(
                    context: context,
                    title: "E-Rickshaw Booking",
                    subtitle: "Book e-rickshaw inside campus",
                    imagePath: "assets/images/rickshaw.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ErickshawBookingScreen(),
                        ),
                      );
                    },
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