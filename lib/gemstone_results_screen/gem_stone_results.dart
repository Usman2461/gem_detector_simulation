import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
import 'package:gem_detector_simulation/widgets/custom_button.dart';
import 'package:gem_detector_simulation/start_screen/start_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_helper/ad_helper.dart';
class GemstoneResults extends StatefulWidget {
  const GemstoneResults({Key? key}) : super(key: key);

  @override
  State<GemstoneResults> createState() => _GemstoneResultsState();
}

class _GemstoneResultsState extends State<GemstoneResults> {

  InterstitialAd? _interstitialAd;
  int _interstitialAttempts = 0;
  late BannerAd _bottomBannerAd;
  bool isBannerAdLoaded = false;

  FlutterTts flutterTts = FlutterTts();
  final number = Random().nextDouble();
  Future _speak(String _newVoiceText) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setPitch(1);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }
  
  initState(){
    super.initState();
    _speak(number<0.5?"Gemstone is fake":"Gemstone is original");
    generateInterstitialAd();
    createBtmBannerAd();
  }

  void generateInterstitialAd() {
    InterstitialAd.load(adUnitId: AdHelper.interstitialAdUnitId2,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              _interstitialAd = ad;
              _interstitialAttempts = 0;
            }, onAdFailedToLoad: (LoadAdError error) {
          _interstitialAttempts += 1;
          _interstitialAd = null;
          if (_interstitialAttempts >= maxFailedLoadAttempts) {
            generateInterstitialAd();
          }
        }));
  }
  void createBtmBannerAd() {
    _bottomBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId6,
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

  void showAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (InterstitialAd ad){
            ad.dispose();
            generateInterstitialAd();
          }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error){
            ad.dispose();
            generateInterstitialAd();
          });
      _interstitialAd!.show();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _interstitialAd?.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  isBannerAdLoaded
          ? Container(
        color: Colors.black54,
        height: _bottomBannerAd.size.height.toDouble(),
        width: _bottomBannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bottomBannerAd,),
      )
          : SizedBox(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Results"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0))),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height-kToolbarHeight,
        width: MediaQuery.of(context).size.width,
        child: number<0.5?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gemstone is Fake",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                height: 150,
                width: 150,
                image: AssetImage("assets/images/fake.gif"),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Warning! Don't use finger or another material!!!",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 10,),
            CustomButton(text: "Try Again",onTap: (){
              showAd();
              Navigator.popAndPushNamed(context, "/start");
            },),
          ],
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gemstone is Original",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                height: 150,
                width: 150,
                image: AssetImage("assets/images/tenor.gif"),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Warning! Don't use finger or another material!!!",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 10,),
            CustomButton(text: "Try Again",onTap: (){
              showAd();
              Navigator.popAndPushNamed(context, "/start");
            },),
          ],
        ),
      )),
    );
  }
}
