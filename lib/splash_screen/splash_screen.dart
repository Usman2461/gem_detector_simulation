import 'package:flutter/material.dart';
import 'package:gem_detector_simulation/start_screen/start_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_helper/ad_helper.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
// new package name
// com.alphasofts.gemsdetectorsimulator
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  late BannerAd _bottomBannerAd;
  bool isBannerAdLoaded = false;
  @override
  void initState(){
  super.initState();
  createBtmBannerAd();
  navigateToStart();
  }
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bottomBannerAd.dispose();
  }

  navigateToStart() async{
    await Future.delayed(Duration(seconds: 3), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  isBannerAdLoaded
          ? Container(
        height: _bottomBannerAd.size.height.toDouble(),
        width: _bottomBannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bottomBannerAd,),
      )
          : SizedBox(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
            ),
            color: Colors.black),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Gem Detector V2",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  void createBtmBannerAd() {
    _bottomBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            isBannerAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: AdRequest());
    _bottomBannerAd.load();
  }
}
