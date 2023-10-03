import 'package:cached_network_image/cached_network_image.dart';
import 'package:sportapp/configurations/imports.dart';
import 'package:sportapp/home_module/views/details.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  TipsController tipsController = Get.put(TipsController());
  late InterstitialAd _interstitialAd;
  late BannerAd _bannerAd;
  bool _isAdLoadedInt = false;
  bool _isAdLoaded = false;
  GetStorage cache = GetStorage();

  void _initbanner() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-4493845659843818/2892930331',
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          // Get.snackbar('error', error.message.toString());
          // print(error.message.toString());
        }),
        request: const AdRequest());
    _bannerAd.load();
  }

  void intAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-4493845659843818/1457339984',
        request: const AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          setState(() {
            _isAdLoadedInt = true;
          });
        }, onAdFailedToLoad: (error) {
          // Get.snackbar('Error', error.message.toString());
        }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MobileAds.instance.initialize();
    tipsController.fetchtipsHistoty();
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
                  padding: const EdgeInsets.only(top: 100),
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

                Padding(
                  padding: const EdgeInsets.only(top: 130, left: 7),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Free Matches History',
                            style: GoogleFonts.acme(fontSize: 18),
                          ),
                          Text(
                            '',
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
                  padding: const EdgeInsets.only(top: 150),
                  child: _isAdLoaded == true
                      ? Container(
                          width: _bannerAd.size.width.toDouble(),
                          height: _bannerAd.size.height.toDouble(),
                          child: token == null
                              ? AdWidget(ad: _bannerAd)
                              : SizedBox())
                      : SizedBox(),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Obx(() {
                      if (tipsController.isLoading.value) {
                        return const CircularProgressIndicator();
                      } else if (tipsController.tipsHistotyList.isEmpty) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
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
                          itemCount: tipsController.tipsHistotyList.length,
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
                                        .tipsHistotyList[index]
                                        .homeTeamId
                                        .strTeam
                                        .toString(),
                                    home_strTeamBadge: tipsController
                                        .tipsHistotyList[index]
                                        .homeTeamId
                                        .strTeamBadge
                                        .toString(),
                                    away_strTeam: tipsController
                                        .tipsHistotyList[index]
                                        .awayTeamId
                                        .strTeam
                                        .toString(),
                                    away_strTeamBadge: tipsController
                                        .tipsHistotyList[index]
                                        .awayTeamId
                                        .strTeamBadge
                                        .toString(),
                                    strStadium: tipsController
                                        .tipsHistotyList[index]
                                        .homeTeamId
                                        .strStadium
                                        .toString(),
                                    match_tips: tipsController
                                        .tipsHistotyList[index].matchTips,
                                    strStadiumThumb: tipsController
                                        .tipsHistotyList[index]
                                        .homeTeamId
                                        .strStadiumThumb
                                        .toString(),
                                    status: tipsController
                                        .tipsHistotyList[index].status,
                                    result: tipsController
                                        .tipsHistotyList[index].result,
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
                                                  tipsController
                                                      .tipsHistotyList[index]
                                                      .homeTeamId
                                                      .strTeamShort
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
                                                      .tipsHistotyList[index]
                                                      .homeTeamId
                                                      .strTeamBadge
                                                      .toString(),
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: CircularProgressIndicator(
                                                              value:
                                                                  downloadProgress
                                                                      .progress)),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ],
                                            ),
                                            if (tipsController
                                                    .tipsHistotyList[index]
                                                    .status ==
                                                'win')
                                              const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                            else if (tipsController
                                                    .tipsHistotyList[index]
                                                    .status ==
                                                'lose')
                                              Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              )
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
                                                  imageUrl: tipsController
                                                      .tipsHistotyList[index]
                                                      .awayTeamId
                                                      .strTeamBadge
                                                      .toString(),
                                                  width: 20,
                                                  height: 20,
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: CircularProgressIndicator(
                                                              value:
                                                                  downloadProgress
                                                                      .progress)),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  tipsController
                                                          .tipsHistotyList[
                                                              index]
                                                          .awayTeamId
                                                          .strTeamShort ??
                                                      tipsController
                                                          .tipsHistotyList[
                                                              index]
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
                                      Text(tipsController.tipsHistotyList[index]
                                          .homeTeamId.strStadium
                                          .toString())
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
