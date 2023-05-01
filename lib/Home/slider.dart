import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scholarship_vjti/Home/slide.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;



class slider extends StatefulWidget {
  List<String> imageUrls = [];
  slider({Key? key , required this.imageUrls}) : super(key: key );
  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {

  
  @override
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider.builder(
            itemCount:  widget.imageUrls.isEmpty
          ? 0 : widget.imageUrls.length,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
              viewportFraction: 0.97,
              initialPage: 0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (BuildContext context, int index, int page) {
               return widget.imageUrls.isEmpty
          ?  Center(child: CircularProgressIndicator())
              :  Container(
                width: double.infinity,
                height: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 40,
                  shadowColor: Color.fromARGB(0, 216, 55, 55),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                        image: NetworkImage(widget.imageUrls[index]),
                        fit: BoxFit.cover),
                  ),
                ),
              );
            }),
        SizedBox(
          height: 10,
        ),
        BuildIndicator(activeIndex),
      ],
    );
  }

  Widget BuildIndicator(int activeIndex) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count:  widget.imageUrls.isEmpty
          ? 0 : widget.imageUrls.length,
      effect: SlideEffect(
          spacing: 8.0,
          radius: 8.0,
          dotWidth: 12.0,
          dotHeight: 12.0,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5,
          dotColor: Colors.grey,
          activeDotColor: Color.fromARGB(255, 76, 107, 175)),
    );
  }
}
