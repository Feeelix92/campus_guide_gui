import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  static void triggerFunction() {
    //TODO hier die Upload-API einbinden
    print('Upload');
  }

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50,
            child: _pickedImage == null
                ? const Icon(Icons.person)
                : kIsWeb
                    ? Image.memory(webImage, fit: BoxFit.fill)
                    : Image.file(_pickedImage!, fit: BoxFit.fill)),
        TextButton(
            onPressed: _pickImage, child: const Text('Lade ein Bild hoch'))
      ],
    );
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('Kein Bild ausgewählt.');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('Kein Bild ausgewählt.');
      }
    } else {
      print('Fehler');
    }
  }
}
