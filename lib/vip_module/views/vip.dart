import 'package:cached_network_image/cached_network_image.dart';
import 'package:sportapp/configurations/imports.dart';
import 'package:sportapp/home_module/views/details.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:sportapp/vip_module/controllers/match_controller.dart';
import 'package:sportapp/vip_module/views/create.dart';
import 'package:sportapp/vip_module/views/history.dart';


class VIP extends StatefulWidget {
  const VIP({Key? key}) : super(key: key);
  @override
  State<VIP> createState() => _VIPState();
}

class _VIPState extends State<VIP> {
  TeamController teamController = TeamController();
  GetStorage cache = GetStorage();
  late InterstitialAd _interstitialAd;
  late BannerAd _bannerAd;
  bool _isAdLoadedInt = false;
  bool _isAdLoaded = false;


  void _initbanner(){
    _bannerAd = BannerAd(
        size: AdSize.banner,
        // adUnitId: '',
        adUnitId: 'ca-app-pub-4493845659843818/1164598464',
        listener:  BannerAdListener(
            onAdLoaded: (ad){
              setState(() {
                _isAdLoaded = true;
              });
            },
            onAdFailedToLoad: (ad,error){
              // Get.snackbar('error', error.message.toString());
              // print(error.message.toString());
            }

        ),
        request: const AdRequest()
    );
    _bannerAd.load();
  }


  void intAd(){
  InterstitialAd.load(
      adUnitId: 'ca-app-pub-4493845659843818/6661565208',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad){
            _interstitialAd = ad;
            setState(() {
              _isAdLoadedInt = true;
            });
          },
          onAdFailedToLoad: (error){
            // Get.snackbar('Error', error.message.toString());
          }
      )
  );
}



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MobileAds.instance.initialize();
    teamController.fetchVIP();
    intAd();
    _initbanner();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _interstitialAd.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.orange,
                        Colors.black,
                      ],
                    ),
                  ),
                  child: const Row(
                    children: [
                      // Text('Sport Planet')
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 600,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                  ),
                ),

                // const Center(
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: SizedBox(
                      height: 200,
                      width: 370,
                      child: Card(
                          child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.white70,
                                        Colors.orangeAccent
                                      ])),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                        EdgeInsets.only(left: 8.0, top: 30),
                                        child: Text(
                                          "LET'S GO!",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Text(
                                          "Win the Bets  with us!",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 10),
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: TextButton(
                                            onPressed: () {
                                              var token = cache.read('token');
                                              var user = cache.read('user');
                                              print(cache.read('token'));
                                              if(token != null){
                                                Get.to(const CreateTipMatch());
                                              }

                                            },
                                            child: const Text(
                                              'VIP',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                   Expanded(
                                    child: Lottie.asset('assets/animation_ll139fea.json'),
                                  ),
                                ],
                              ))),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 350, left: 7),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'VIP Matches',
                            style: GoogleFonts.acme(fontSize: 18),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(VIPHistory());
                            },
                            child: Text(
                              'See History',
                              style: GoogleFonts.aBeeZee(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 380),
                  child:    _isAdLoaded == true ? Container(
                      width: _bannerAd.size.width.toDouble(),
                      height: _bannerAd.size.height.toDouble(),
                      child:   AdWidget(ad: _bannerAd)
                  ): SizedBox(),
                ),


                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 380),
                    child: Obx(() {
                      if (teamController.isLoading == true) {
                        return const CircularProgressIndicator();
                      }
                      else if(teamController.vipmatches.isEmpty) {
                        return SizedBox(
                          height: 130,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {},
                            child: const Center(
                              child: Text('No data'),
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: teamController.vipmatches.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  _interstitialAd.show();
                                  Get.to(TeamDetails(
                                    home_strTeam: teamController.vipmatches[index]
                                        .homeTeamId.strTeam.toString(),
                                    home_strTeamBadge:
                                    teamController.vipmatches[index]
                                        .homeTeamId.strTeamBadge.toString(),
                                    away_strTeam: teamController.vipmatches[index]
                                        .awayTeamId.strTeam.toString(),
                                    away_strTeamBadge:
                                    teamController.vipmatches[index]
                                        .awayTeamId.strTeamBadge.toString(),
                                    strStadium: teamController.vipmatches[index]
                                        .homeTeamId.strStadium.toString(),
                                    match_tips: teamController.vipmatches[index]
                                        .matchTips,
                                    strStadiumThumb:
                                    teamController.vipmatches[index]
                                        .homeTeamId.strStadiumThumb.toString(),
                                    status: teamController.vipmatches[index].status,
                                    result: teamController.vipmatches[index].result,
                                  ));
                                },
                                child: Card(
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  teamController.vipmatches[index].homeTeamId.strTeamShort.toString(),
                                                  style: GoogleFonts.acme(
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                CachedNetworkImage(
                                                  width:20,
                                                  height:20,
                                                  imageUrl:teamController
                                                      .vipmatches[index]
                                                      .homeTeamId.
                                                  strTeamBadge.toString(),
                                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                      SizedBox(
                                                          width:20,
                                                          height:20,
                                                          child: CircularProgressIndicator(value: downloadProgress.progress)),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),

                                              ],
                                            ),
                                            if(teamController.vipmatches[index].status == 'win')
                                              const Icon(Icons.check_circle,color: Colors.green,)
                                            else if(teamController.vipmatches[index].status == 'lose')
                                              Icon(Icons.close,color: Colors.red,)
                                            else
                                              const Text(
                                                '-',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),

                                            Row(
                                              children: [

                                                CachedNetworkImage(
                                                  width:20,
                                                  height:20,
                                                  imageUrl:teamController
                                                      .vipmatches[index]
                                                      .awayTeamId.
                                                  strTeamBadge.toString(),
                                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                      SizedBox(
                                                          width:20,
                                                          height:20,
                                                          child: CircularProgressIndicator(value: downloadProgress.progress)),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),


                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  teamController.vipmatches[index]
                                                      .awayTeamId.
                                                  strTeamShort ??
                                                      teamController
                                                          .vipmatches[index]
                                                          .awayTeamId.
                                                      strTeam.toString(),
                                                  style: GoogleFonts.acme(
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(teamController.vipmatches[index]
                                          .homeTeamId.strStadium.toString())
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
// Center(
// child: Padding(
// padding: const EdgeInsets.only(top: 120),
// child: SizedBox(
// height: 200,
// width: 370,
// child: Stack(
// children: [
// // Background Image
// Image.asset(
// 'assets/stadium.jpg',
// fit: BoxFit.cover,
// width: double.infinity,
// height: double.infinity,
// ),
// // Card with content on top of the image
// Card(
// color: Colors.blue.withOpacity(0.6),
// // Set card color to transparent
// elevation: 4,
// // Optional: Add a shadow effect for the card
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(0),
// ),
// child:  const Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "LET'S GO!",
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: 16),
// ),
// Padding(
// padding: EdgeInsets.only(left: 50),
// child: Image(
// image: AssetImage('assets/gernacho.png')),
// )
// ],
// )),
// ],
// ),
// ),
// ),
// ),
