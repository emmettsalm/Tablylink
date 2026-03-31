import 'package:flutter/material.dart';
import 'package:tablylink/utils/app_theme.dart';
import 'package:tablylink/models/restaurant.dart';
import 'package:tablylink/screens/booking_step1_screen.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getCuisineIcon(widget.restaurant.cuisine),
                  size: 60,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text(
              widget.restaurant.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, size: 20, color: Colors.orange),
                const SizedBox(width: 4),
                Text('${widget.restaurant.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                const Icon(Icons.location_on, size: 20, color: AppTheme.textSecondary),
                const SizedBox(width: 4),
                Text(widget.restaurant.location, style: const TextStyle(color: AppTheme.textSecondary)),
              ],
            ),
            const SizedBox(height: 16),

            const Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              widget.restaurant.description,
              style: const TextStyle(color: AppTheme.textSecondary, height: 1.5),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookingStep1Screen(restaurant: widget.restaurant),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50), // ปรับปุ่มให้เต็มหน้าจอ
          ),
          child: const Text('Reserve a Table'),
        ),
      ),
    );
  }

  IconData _getCuisineIcon(String cuisine) {
    switch (cuisine) {
      default: return Icons.restaurant;
    }
  }
}