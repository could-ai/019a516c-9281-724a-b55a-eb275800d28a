import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/prayer_time.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final List<PrayerTime> _prayerTimes = [
    PrayerTime(name: 'Fajr', time: '5:00 AM'),
    PrayerTime(name: 'Dhuhr', time: '1:15 PM'),
    PrayerTime(name: 'Asr', time: '4:45 PM'),
    PrayerTime(name: 'Maghrib', time: '6:40 PM'),
    PrayerTime(name: 'Isha', time: '8:00 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Times - Bangladesh'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: _prayerTimes.length,
        itemBuilder: (context, index) {
          final prayerTime = _prayerTimes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.access_time),
              title: Text(prayerTime.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(prayerTime.time, style: const TextStyle(fontSize: 16)),
              trailing: Switch(
                value: prayerTime.isAlarmOn,
                onChanged: (bool value) {
                  setState(() {
                    prayerTime.isAlarmOn = value;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
