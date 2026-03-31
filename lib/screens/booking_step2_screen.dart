import 'package:flutter/material.dart';
import 'package:tablylink/utils/app_theme.dart';
import 'package:tablylink/models/restaurant.dart';

class BookingStep2Screen extends StatefulWidget {
  final Restaurant restaurant;
  final DateTime date;
  final TimeOfDay time;
  final int persons;

  const BookingStep2Screen({
    super.key,
    required this.restaurant,
    required this.date,
    required this.time,
    required this.persons,
  });

  @override
  State<BookingStep2Screen> createState() => _BookingStep2ScreenState();
}

class _BookingStep2ScreenState extends State<BookingStep2Screen> {
  String _selectedZone = 'สวน';
  final List<String> _zones = ['สวน', 'น้ำพุ', 'ชั้น 1', 'กลางแจ้ง'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Choose Table',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: _buildStepIndicator(),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Select Zone',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _zones.length,
                itemBuilder: (context, index) {
                  final zone = _zones[index];
                  final isSelected = zone == _selectedZone;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Row(
                        children: [
                          if (isSelected) ...[
                            const Icon(Icons.check, color: Colors.white, size: 16),
                            const SizedBox(width: 4),
                          ],
                          Text(zone),
                        ],
                      ),
                      selected: isSelected,
                      selectedColor: AppTheme.primaryColor,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : AppTheme.textPrimary,
                        fontWeight: FontWeight.normal,
                      ),
                      showCheckmark: false,
                      onSelected: (_) {
                        setState(() {
                          _selectedZone = zone;
                        });
                      },
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

  Widget _buildStepIndicator() {
    return Row(
      children: [
        _buildStep(1, 'Date & Time', false, true),
        Expanded(
            child:
            Container(height: 2, color: AppTheme.primaryColor)),
        _buildStep(2, 'Choose Table', true, false),
        Expanded(child: Container(height: 2, color: Colors.grey.shade300)),
        _buildStep(3, 'Information', false, false),
      ],
    );
  }

  Widget _buildStep(int number, String label, bool isActive, bool isCompleted) {
    final color = isActive || isCompleted
        ? AppTheme.primaryColor
        : Colors.grey.shade300;
    return Column(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: color,
          child: isCompleted
              ? const Icon(Icons.check, color: Colors.white, size: 18)
              : Text(
            '$number',
            style: TextStyle(
              color: isActive ? Colors.white : AppTheme.textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isActive || isCompleted
                ? AppTheme.primaryColor
                : AppTheme.textSecondary,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
