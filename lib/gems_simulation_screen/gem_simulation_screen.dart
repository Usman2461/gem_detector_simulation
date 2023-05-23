import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gem_detector_simulation/gemstone_results_screen/gem_stone_results.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ad_helper/ad_helper.dart';

class GemSimulationScreen extends StatefulWidget {
  const GemSimulationScreen({Key? key}) : super(key: key);

  @override
  State<GemSimulationScreen> createState() => _GemSimulationScreenState();
}

class _GemSimulationScreenState extends State<GemSimulationScreen> {
  FlutterTts flutterTts = FlutterTts();
  late BannerAd _bottomBannerAd;
  bool isBannerAdLoaded = false;
  late BannerAd _bottomBannerAd2;
  bool isBannerAdLoaded2 = false;

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

  initState() {
    super.initState();
    _speak("Swipe your gem stone");
    createBtmBannerAd();
    createBtmBannerAd2();
    navigateToResults();
  }

  void createBtmBannerAd() {
    _bottomBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId4,
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
  void createBtmBannerAd2() {
    _bottomBannerAd2 = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId5,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            isBannerAdLoaded2 = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: AdRequest());
    _bottomBannerAd2.load();
  }
  navigateToResults() async {
    await Future.delayed(Duration(seconds: 7), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => GemstoneResults()));
  }

  String urlLink = "https://www.youtube.com/watch?v=bNnFacgHNfg&t=1s";
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(urlLink))) {
      throw Exception('Could not launch $urlLink');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bottomBannerAd.dispose();
    _bottomBannerAd2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar:  isBannerAdLoaded
          ? Container(
        color: Colors.black54,
        height: _bottomBannerAd.size.height.toDouble(),
        width: _bottomBannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bottomBannerAd,),
      )
          : SizedBox(),
      body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                isBannerAdLoaded2
                    ? Container(
                  color: Colors.black54,
                  height: _bottomBannerAd.size.height.toDouble(),
                  width: _bottomBannerAd.size.width.toDouble(),
                  child: AdWidget(ad: _bottomBannerAd2,),
                )
                    : SizedBox(),
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {

                                  },
                                  icon: Image(
                                    fit: BoxFit.fill,
                                    width: 60,height: 60,
                                    image: AssetImage("assets/images/help.png"),
                                  )),
                            ],
                          ),
                          Text(
                            "Swipe your Gem-Stone",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(image: AssetImage("assets/images/on.gif")),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
