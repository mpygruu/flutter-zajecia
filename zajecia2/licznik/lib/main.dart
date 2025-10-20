import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int licznik = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(licznik.toString(), style: TextStyle(fontSize: 100)),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          licznik -= 1;
                        });
                      },
                      icon: Icon(Icons.remove, size: 50),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          licznik = 0;
                        });
                      },
                      icon: Icon(Icons.exposure_zero, size: 50),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          licznik += 1;
                        });
                      },
                      icon: Icon(Icons.add, size: 50),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
