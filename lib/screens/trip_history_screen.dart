
import 'package:autoride/res/color_manager.dart';
import 'package:flutter/material.dart';

class TripHistory extends StatelessWidget {
  const TripHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackGroundColor,
      appBar: AppBar(
        title: const Text('Trip History'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            TripHistoryItem(
              date: 'Nov 20, 2023',
              from: 'Home',
              to: 'Work',
              cost: '\$15.00',
            ),
            Divider(),
            TripHistoryItem(
              date: 'Nov 19, 2023',
              from: 'Work',
              to: 'Gym',
              cost: '\$10.00',
            ),
            Divider(),
            TripHistoryItem(
              date: 'Nov 18, 2023',
              from: 'Gym',
              to: 'Home',
              cost: '\$12.50',
            ),
            // Add more TripHistoryItem widgets for additional trips
          ],
        ),
      ),
    );
  }
}

class TripHistoryItem extends StatelessWidget {
  final String date;
  final String from;
  final String to;
  final String cost;

  const TripHistoryItem({super.key, 
    required this.date,
    required this.from,
    required this.to,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Trip on $date'),
      subtitle: Text('$from to $to'),
      trailing: Text('Cost: $cost'),
      // Add additional details or actions as needed
    );
  }
}