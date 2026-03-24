import 'package:flutter/material.dart';
import '../services/booking_service.dart';
import 'driver_assigned_screen.dart';

class ConfirmRideScreen extends StatefulWidget {
  final String pickup;
  final String drop;

  const ConfirmRideScreen({
    super.key,
    required this.pickup,
    required this.drop,
  });

  @override
  State<ConfirmRideScreen> createState() => _ConfirmRideScreenState();
}

class _ConfirmRideScreenState extends State<ConfirmRideScreen> {

  final BookingService bookingService = BookingService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Ride")),

      body: Stack(
        children: [

          /// 🔵 CONTENT
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                Text("Pickup: ${widget.pickup}",
                    style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 10),

                Text("Drop: ${widget.drop}",
                    style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 20),

                const Text(
                  "Estimated Fare: ₹30",
                  style: TextStyle(fontSize: 16),
                ),

                const Text(
                  "Estimated Time: 10 mins",
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 40),

                isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F6F6D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Confirm Ride",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {

                      setState(() {
                        isLoading = true;
                      });

                      final result = await bookingService.requestRide(
                        widget.pickup,
                        widget.drop,
                      );

                      print(result);

                      setState(() {
                        isLoading = false;
                      });

                      if (result != null) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ride requested successfully"),
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const DriverAssignedScreen(),
                          ),
                        );
                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ride request failed"),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}