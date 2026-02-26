import 'package:flutter/material.dart';

class RideRequestScreen extends StatefulWidget {
  const RideRequestScreen({super.key});

  @override
  State<RideRequestScreen> createState() => _RideRequestScreenState();
}

class _RideRequestScreenState extends State<RideRequestScreen> {

  // Backend se aayega
  List<Map<String, dynamic>> rideRequests = [];

  void acceptRide(int index) {
    // 🔥 Backend API call yaha lagegi
    setState(() {
      rideRequests.removeAt(index);
    });
  }

  void rejectRide(int index) {
    // 🔥 Backend API call yaha lagegi
    setState(() {
      rideRequests.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F6F6D),
      body: Column(
        children: [

          const SizedBox(height: 70),

          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const Expanded(
                child: Text(
                  "Ride Requests",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFE6F4F1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: rideRequests.isEmpty
                  ? const Center(
                child: Text(
                  "No Pending Ride Requests",
                  style: TextStyle(fontSize: 16),
                ),
              )
                  : ListView.builder(
                itemCount: rideRequests.length,
                itemBuilder: (context, index) {
                  final ride = rideRequests[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Student: ${ride["student"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          Text("Pickup: ${ride["pickup"]}"),
                          Text("Drop: ${ride["drop"]}"),
                          Text("Distance: ${ride["distance"]}"),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    const Color(0xFF2F6F6D),
                                  ),
                                  onPressed: () {
                                    acceptRide(index);
                                  },
                                  child: const Text("Accept"),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    rejectRide(index);
                                  },
                                  child: const Text("Reject"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
