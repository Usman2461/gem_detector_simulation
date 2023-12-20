import 'package:flutter/material.dart';
import 'package:gem_detector_simulation/gems_simulation_screen/gem_simulation_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ad_helper/ad_helper.dart';
import '../privacy_policy/privacy_policy_page.dart';
import '../tuning_screen/fine_tune_settingss.dart';
class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}
const int maxFailedLoadAttempts = 3;

class _StartScreenState extends State<StartScreen> {
  InterstitialAd? _interstitialAd;
  int _interstitialAttempts = 0;
  late BannerAd _bottomBannerAd;
  bool isBannerAdLoaded = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateInterstitialAd();
    createBtmBannerAd();

  }

  void generateInterstitialAd() {
    InterstitialAd.load(adUnitId: AdHelper.interstitialAdUnitId,
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
      backgroundColor: Colors.black54,
      bottomNavigationBar:  isBannerAdLoaded
          ? Container(
        color: Colors.black54,
        height: _bottomBannerAd.size.height.toDouble(),
        width: _bottomBannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bottomBannerAd,),
      )
          : const SizedBox(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image(
                    image: const AssetImage("assets/images/hback2.png"),
                    fit: BoxFit.fill,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                  ),
                  Column(
                    children: [
                      Text(
                        "Click to Start Button!!",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 20.0,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                        onPressed: () {
                          showAd();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>GemSimulationScreen()));
                        }, child: CircleAvatar(child: Image(
                        image: AssetImage("assets/images/startbutton.png"),
                      ), radius: 100, backgroundColor: Colors.white,),),
                      SizedBox(height: 30.0,),
                      Text("Warning! Dont swipe finger or another material!!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0,),
                      ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FineTuneScreen()));
                      }, child: Text("Fine Tune Settings", style: TextStyle(fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10.0,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyPage()));
                      }, child: Text("Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold),))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
