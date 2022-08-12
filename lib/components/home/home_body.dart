import 'package:airbnbapp/components/home/home_body_banner.dart';
import 'package:airbnbapp/components/home/home_body_popular.dart';
import 'package:airbnbapp/size.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double bodyWidth = getBodyWidth(context);
    print("bodyWidth : $bodyWidth");

    double currentSize = MediaQuery.of(context).size.width;
    return Align(
      child: SizedBox(
        width: currentSize < 420 ? double.infinity : bodyWidth,
        child: Column(
          children: [
            HomeBodyBanner(),
            HomeBodyPopular(),
          ],
        ),
      ),
    );
  }
}
