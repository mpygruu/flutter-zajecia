import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 140,
              backgroundImage: NetworkImage("https://placecats.com/300/300"),
            ),
            SizedBox(height: 24),
            Text(
              "Jan Kowalski",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text("Senior Flutter Developer", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 32),
            ContactTile(text: "+48 123 456 789", icon: Icons.phone),
            SizedBox(height: 16),
            ContactTile(text: "jan.kowalski@example.com", icon: Icons.mail),
            SizedBox(height: 16),
            ContactTile(text: "Warszawa, Polska", icon: Icons.location_pin),
            SizedBox(height: 48),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Dzwonię do ....")));
              },
              child: Text("Skontaktuj się!"),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final String text;
  final IconData icon;

  const ContactTile({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30),
        SizedBox(width: 16),
        Text(text, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
