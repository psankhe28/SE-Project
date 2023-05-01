import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImageUrls();
  }  
  Future<void> _loadImageUrls() async {
  final storageRef = FirebaseStorage.instance.ref().child("sliderImages");
  final items = await storageRef.listAll();
  print(items);
  for (var item in items.items) {
    try {
      final url = await item.getDownloadURL();
      setState(() {
        _imageUrls.add(url.toString());
        print(_imageUrls);
      });
    } catch (e) {
      print("Error getting URL: $e");
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _imageUrls.length,
          itemBuilder: (context, index) {
            print(_imageUrls);
            return Image.network(_imageUrls[index]);
          },
        ),
      ),
    );
  }
}
