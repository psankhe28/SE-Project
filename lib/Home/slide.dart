import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scholarship_vjti/Home/slider.dart';

// class MyWidget extends StatefulWidget {
//   MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   final referance = FirebaseStorage.instance.ref();

//    late List<String> imageUrls = [];

//   Future<String> getImageUrls(String image) async {
//     try {
//       var urlRef =
//           referance.child('sliderImages').child('${image.toLowerCase()}');
//       var imgurl = await urlRef.getDownloadURL();
//       print('image url is : ' + imgurl);
//       print(imgurl);
//       return imgurl ; 
//     } catch (e) {
//       return '';
//     }
//   }

//   Future<void> getImages() async {
//     List<String> imgName = ['1st.jpeg', '3rd.jpeg', '4th.jpeg', '7th.jpeg', '6th.jpeg'];

//     try {
//       for (var img in imgName) {
//         final imgUrl = await getImageUrls(img);
//         if (imgUrl != null) {
//           imageUrls.add(imgUrl);
//         }
//       }
//       print(imageUrls.length);
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//     @override
//   void initState() {
//     super.initState();
//      getImages() ;
//      print("All done");
//   }

//   Widget build(BuildContext context) {
//     return imageUrls.isNotEmpty ?  slider(images: imageUrls) : Center(child: CircularProgressIndicator());
//   }
// }







// class ImageListPage extends StatefulWidget {
//   @override
//   _ImageListPageState createState() => _ImageListPageState();
// }

// class _ImageListPageState extends State<ImageListPage> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image List'),
//       ),
      // body: _imageUrls.isEmpty
      //     ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _imageUrls.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   height: 200.0,
//                   child: Image.network(_imageUrls[index]),
//                 );
//               },
//             ),
//     );
//   }
// }
