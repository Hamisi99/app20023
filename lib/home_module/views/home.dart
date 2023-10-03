import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sportapp/configurations/imports.dart';
import 'package:sportapp/home_module/views/details.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sportapp/vip_module/views/vip.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TipsController tipsController = Get.put(TipsController());
  late InterstitialAd _interstitialAd;
  late BannerAd _bannerAd;
  bool _isAdLoadedInt = false;
  bool _isAdLoaded = false;
  GetStorage cache = GetStorage();

  void _initbanner() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        // adUnitId: '',
        adUnitId: 'ca-app-pub-4493845659843818/8762094874',
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              setState(() {
                _isAdLoaded = true;
              });
            },
            onAdFailedToLoad: (ad, error) {
              // Get.snackbar('error', error.message.toString());
              // print(error.message.toString());
            }

        ),
        request: const AdRequest()
    );
    _bannerAd.load();
  }

  void intAd() {
    InterstitialAd.load(
      // adUnitId: 'ca-app-pub-4493845659843818/8500185089',
        adUnitId: 'ca-app-pub-4493845659843818/8500185089',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              _interstitialAd = ad;
              setState(() {
                _isAdLoadedInt = true;
              });
            },
            onAdFailedToLoad: (error) {
              // Get.snackbar('Error', error.message.toString());
            }
        )
    );
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    tipsController.chechInternet();
    MobileAds.instance.initialize();
    tipsController.fetchAppVersion();
    tipsController.fetchtips();
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
    var token = cache.read('token');
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
                                              // showModalBottomSheet(
                                              //   context: context,
                                              //   builder:
                                              //       (BuildContext context) {
                                              //     return Container(
                                              //       child: Column(
                                              //         mainAxisSize:
                                              //             MainAxisSize.min,
                                              //         children: <Widget>[
                                              //           ListTile(
                                              //             leading:
                                              //                 Icon(Icons.call),
                                              //             title: Text('Call'),
                                              //             onTap: () {
                                              //
                                              //               launch(
                                              //                   'tel:+255763993522'); // Replace with the actual phone number
                                              //               Navigator.pop(
                                              //                   context);
                                              //             },
                                              //           ),
                                              //           ListTile(
                                              //             leading: const Icon(
                                              //                 Icons.message),
                                              //             title:
                                              //                 const Text('Message'),
                                              //             onTap: () {
                                              //               launch(
                                              //                   'sms:+255763993522'); // Replace with the actual phone number
                                              //               Navigator.pop(
                                              //                   context); // Replace with the actual phone number
                                              //               Navigator.pop(
                                              //                   context);
                                              //             },
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     );
                                              //   },
                                              // );

                                              final Uri uri = Uri.parse("https://t.me/planettips2023");
                                              launchUrl(uri);

                                            },
                                            child: const Text(
                                              'Join Telegram',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Expanded(
                                    child: Image(
                                        image:
                                        AssetImage('assets/gernacho.png')),
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
                            'Free Matches',
                            style: GoogleFonts.acme(fontSize: 18),
                          ),
                          Text(
                            'see all',
                            style: GoogleFonts.aBeeZee(color: Colors.blue),
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
                  child: _isAdLoaded == true ? Container(
                      width: _bannerAd.size.width.toDouble(),
                      height: _bannerAd.size.height.toDouble(),
                      child: token == null ? AdWidget(ad: _bannerAd) :
                      SizedBox()
                  ) : SizedBox(),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 380),
                    child: Obx(() {
                      if (tipsController.NoConnection == true.obs) {
                        return SizedBox(
                          height: 130,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {},
                            child: const Center(
                              child: Text('No Internet Connection'),
                            ),
                          ),
                        );
                      }

                      if (tipsController.isLoading == true.obs) {
                        return const CircularProgressIndicator();
                      }
                      if (tipsController.tipsList.isEmpty) {
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
                          itemCount: tipsController.tipsList.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  if (token == null) {
                                    _interstitialAd.show();
                                  }
                                  Get.to(TeamDetails(
                                    home_strTeam: tipsController
                                        .tipsList[index].homeTeamId.strTeam
                                        .toString(),
                                    home_strTeamBadge: tipsController
                                        .tipsList[index].homeTeamId.strTeamBadge
                                        .toString(),
                                    away_strTeam: tipsController
                                        .tipsList[index].awayTeamId.strTeam
                                        .toString(),
                                    away_strTeamBadge: tipsController
                                        .tipsList[index].awayTeamId.strTeamBadge
                                        .toString(),
                                    strStadium: tipsController
                                        .tipsList[index].homeTeamId.strStadium
                                        .toString(),
                                    match_tips: tipsController
                                        .tipsList[index].matchTips,
                                    strStadiumThumb: tipsController
                                        .tipsList[index]
                                        .homeTeamId
                                        .strStadiumThumb
                                        .toString(),
                                    status:
                                    tipsController.tipsList[index].status,
                                    result:
                                    tipsController.tipsList[index].result,
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
                                                  tipsController.tipsList[index]
                                                      .homeTeamId.strTeamShort
                                                      .toString(),
                                                  style: GoogleFonts.acme(
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),

                                                CachedNetworkImage(
                                                  width: 20,
                                                  height: 20,
                                                  imageUrl: tipsController
                                                      .tipsList[index]
                                                      .homeTeamId
                                                      .strTeamBadge
                                                      .toString(),
                                                  progressIndicatorBuilder: (
                                                      context, url,
                                                      downloadProgress) =>
                                                      SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: CircularProgressIndicator(
                                                              value: downloadProgress
                                                                  .progress)),
                                                  errorWidget: (context, url,
                                                      error) =>
                                                      Icon(Icons.error),
                                                ),
                                                // Image(
                                                //   image: NetworkImage(
                                                //       tipsController
                                                //           .tipsList[index]
                                                //           .homeTeamId
                                                //           .strTeamBadge
                                                //           .toString()),
                                                //   width: 30,
                                                //   height: 30,
                                                // )
                                              ],
                                            ),
                                            if (tipsController
                                                .tipsList[index].status ==
                                                'win')
                                              const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                            else
                                              if (tipsController
                                                  .tipsList[index].status ==
                                                  'lose')
                                                Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                )
                                              else
                                                const Text(
                                                  '-',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 20),
                                                ),
                                            Row(
                                              children: [
                                                CachedNetworkImage(
                                                  width: 20,
                                                  height: 20,
                                                  imageUrl: tipsController
                                                      .tipsList[index]
                                                      .awayTeamId
                                                      .strTeamBadge
                                                      .toString(),
                                                  progressIndicatorBuilder: (
                                                      context, url,
                                                      downloadProgress) =>
                                                      SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: CircularProgressIndicator(
                                                              value: downloadProgress
                                                                  .progress)),
                                                  errorWidget: (context, url,
                                                      error) =>
                                                      Icon(Icons.error),
                                                ),
                                                // Image(
                                                //   image: NetworkImage(
                                                //       tipsController
                                                //           .tipsList[index]
                                                //           .awayTeamId
                                                //           .strTeamBadge
                                                //           .toString()),
                                                //   width: 30,
                                                //   height: 30,
                                                // ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  tipsController
                                                      .tipsList[index]
                                                      .awayTeamId
                                                      .strTeamShort ??
                                                      tipsController
                                                          .tipsList[index]
                                                          .awayTeamId
                                                          .strTeam
                                                          .toString(),
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
                                      Text(tipsController
                                          .tipsList[index].homeTeamId.strStadium
                                          .toString())
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }),
                  ),
                ),

                if(tipsController.appVersion.isNotEmpty)
                  if(tipsController.appVersion[0].version !=
                      tipsController.myAppVersion &&
                      tipsController.dialogIsShowing.value)
                    Padding(
                      padding: const EdgeInsets.only(top: 300.0),
                      child: AlertDialog(
                        backgroundColor: Colors.orangeAccent,
                        title: Text('New Update ${tipsController.appVersion[0]
                            .version}'),
                        content: Text(
                            tipsController.appVersion[0].versionReleaseNote),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                tipsController
                                    .dialogIsShowing(false)
                                    .obs;
                              }); // Close the dialog
                            },
                            child: const Text('Later'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final Uri uri = Uri.parse("https://play.google.com/store/apps/details?id=com.planettips");
                              launchUrl(uri);
                            },
                            child: const Text('Update Now'),
                          ),


                        ],
                      ),
                    ),


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
