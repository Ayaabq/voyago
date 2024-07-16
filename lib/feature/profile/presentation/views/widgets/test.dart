import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Bookings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBookingsView(),
    );
  }
}

class MyBookingsView extends StatefulWidget {
  const MyBookingsView({super.key});

  @override
  _MyBookingsViewState createState() => _MyBookingsViewState();
}

class _MyBookingsViewState extends State<MyBookingsView> {
  int selectedIndex = 0;

  final List<Booking> bookings = [
    Booking(
      title: 'Berlin: 3-Hours City Tour by Boat',
      location: 'Berlin, Germany',
      date: 'Wed, October 8, 2024',
      details: '2 Adults, 1 Child',
      paymentStatus: 'Paid',
      imageUrl: Wallet.failureDialog,
    ),
    Booking(
      title: 'NY City Tour',
      location: 'Berlin, Germany',
      date: 'Wed, October 8, 2024',
      details: '2 Adults, 1 Child',
      paymentStatus: 'Unpaid',
      imageUrl: Wallet.successDialog,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey[300],
        backgroundColor: Colors.white,
        title: const Text(
          'My bookings',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ToggleButtons(
              borderRadius: BorderRadius.circular(20),
              isSelected: List.generate(3, (index) => index == selectedIndex),
              onPressed: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              selectedColor: Colors.white,
              fillColor: Colors.deepPurple,
              color: Colors.deepPurple,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Upcoming'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Completed'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Cancelled'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  return BookingCard(booking: bookings[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    booking.imageUrl,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.location,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking.date,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking.details,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Payment status: ${booking.paymentStatus}',
                        style: TextStyle(
                          fontSize: 14,
                          color: booking.paymentStatus == 'Paid'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Booking {
  final String title;
  final String location;
  final String date;
  final String details;
  final String paymentStatus;
  final String imageUrl;

  Booking({
    required this.title,
    required this.location,
    required this.date,
    required this.details,
    required this.paymentStatus,
    required this.imageUrl,
  });
}
