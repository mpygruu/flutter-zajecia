import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Projekt Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ImageScreen(),
    );
  }
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  ImageScreenState createState() => ImageScreenState();
}

class ImageScreenState extends State<ImageScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final ImageGallerySaver imageSaver = ImageGallerySaver();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  Future<void> _pickFromGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  Future<void> _saveToGallery() async {
    if (_image != null) {
      try {
        await imageSaver.saveFile(_image!.path);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Zdjęcie zapisane w galerii!')));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Błąd podczas zapisu zdjęcia: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kamera')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, height: 300)
                : Text('Brak wybranego zdjęcia'),
            SizedBox(height: 8),
            ElevatedButton(onPressed: _takePhoto, child: Text('Zrób zdjęcie')),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _pickFromGallery,
              child: Text('Wybierz z galerii'),
            ),
            SizedBox(height: 8),

            ElevatedButton(
              onPressed: _saveToGallery,
              child: Text('Zapisz do galerii'),
            ),
          ],
        ),
      ),
    );
  }
}
