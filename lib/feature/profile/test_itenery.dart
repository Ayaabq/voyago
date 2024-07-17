import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Itinerary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TripItineraryView(),
    );
  }
}

class TripItineraryView extends StatelessWidget {
  const TripItineraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey[300],
        backgroundColor: Colors.white,
        title: const Text(
          'Trip Itinerary',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            TripHeader(),
            SizedBox(height: 16),
            TripStep(
              time: '09:00',
              title: 'Meeting at',
              location: 'Stern und Kreisschiffahrt',
              details:
                  'We will meet at Stern und Kreisschiffahrt, Berlin and wait for all the travelers.',
              duration: '15 minutes',
            ),
            SizedBox(height: 16),
            TripStep(
              time: '09:15',
              title: 'Go on the cruise',
              details: 'We will begin the cruise and take your seats.',
              duration: '5 minutes',
            ),
            SizedBox(height: 16),
            TripStep(
              time: '09:20',
              title: 'Pass by',
              location: 'Charlottenburg Palace',
              details:
                  'We will pass by Charlottenburg Palace and the guide will explain its history and importance.',
              duration: '30 minutes',
              hasDetails: true,
            ),
            SizedBox(height: 16),
            TripStep(
              time: '09:50',
              title: 'Pass by',
              location: 'Reichstag Building',
              details:
                  'We will pass by Reichstag Building and the guide will explain its history and importance.',
              duration: '20 minutes',
              hasDetails: true,
            ),
            SizedBox(height: 16),
            TripStep(
              time: '10:20',
              title: 'Transporting with',
              location: 'Private bus',
              details:
                  'From Reichstag Building to Schmitt restaurant. We will take a private bus.',
              duration: '25 minutes',
              hasDetails: true,
            ),
            SizedBox(height: 16),
            TripStep(
              time: '10:45',
              title: 'Stop at',
              location: 'Schmitt restaurant',
              details:
                  'We will stop at Schmitt restaurant so you can enjoy a meal.',
              duration: '45 minutes',
              hasDetails: true,
              pricing: 'Adult: \$15, Child: \$10',
            ),
            SizedBox(height: 16),
            TripStep(
              time: '11:30',
              title: 'Resume',
              details: 'We will resume the cruise again to complete the tour.',
              duration: '10 minutes',
            ),
            SizedBox(height: 16),
            TripStep(
              time: '11:40',
              title: 'Pass by',
              location: 'Ruinsberg',
              details:
                  'We will pass by Ruinsberg and the guide will explain its history.',
              duration: '20 minutes',
              hasDetails: true,
            ),
            SizedBox(height: 16),
            TripStep(
              time: '12:00',
              title: 'Ends at',
              location: 'Ruinsberg',
              details: 'The trip will end at Ruinsberg.',
              duration: 'See less',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class TripHeader extends StatelessWidget {
  const TripHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '8-Oct',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        DropdownButton<String>(
          value: 'Day 1',
          items: <String>['Day 1', 'Day 2', 'Day 3']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
      ],
    );
  }
}

class TripStep extends StatelessWidget {
  final String time;
  final String title;
  final String? location;
  final String details;
  final String duration;
  final bool hasDetails;
  final String? pricing;

  const TripStep({
    super.key,
    required this.time,
    required this.title,
    this.location,
    required this.details,
    required this.duration,
    this.hasDetails = false,
    this.pricing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Container(
              height: 16,
              width: 2,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (location != null)
                Text(
                  location!,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    decoration: hasDetails ? TextDecoration.underline : null,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                details,
                style: const TextStyle(fontSize: 14),
              ),
              if (pricing != null)
                Text(
                  pricing!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                duration,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
