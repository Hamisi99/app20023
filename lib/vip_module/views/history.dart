import 'package:cached_network_image/cached_network_image.dart';
import 'package:sportapp/configurations/imports.dart';
import 'package:sportapp/home_module/views/details.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sportapp/vip_module/controllers/match_controller.dart';


class VIPHistory extends StatefulWidget {
  const VIPHistory({Key? key}) : super(key: key);

  @override
  State<VIPHistory> createState() => _VIPHistoryState();
}

class _VIPHistoryState extends State<VIPHistory> {
  TeamController teamController = Get.put(TeamController());
  late InterstitialAd _interstitialAd;
  late BannerAd _bannerAd;
  bool _isAdLoadedInt = false;
  bool _isAdLoaded = false;
  GetStorage cache = GetStorage();

  void _initbanner(){
    _bannerAd = BannerAd(
        size: AdSize.banner,
        // adUnitId: '',
        adUnitId: 'ca-app-pub-4493845659843818/8608808369',
        listener:  BannerAdListener(
            onAdLoaded: (ad){
              setState(() {
                _isAdLoaded = true;
              });
            },
            onAdFailedToLoad: (ad,error){
              Get.snackbar('error', error.message.toString());
              print(error.message.toString());
            }

        ),
        request: const AdRequest()
    );
    _bannerAd.load();
  }


  void intAd(){
  InterstitialAd.load(

      adUnitId: 'ca-app-pub-4493845659843818/2722320195',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad){
            _interstitialAd = ad;
            setState(() {
              _isAdLoadedInt = true;
            });
          },
          onAdFailedToLoad: (error){
            Get.snackbar('Error', error.message.toString());
          }
      )
  );
}



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MobileAds.instance.initialize();
    teamController.fetchVIPHistory();
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
    var token  = cache.read('token');
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
                            'Free Matches Histoty',
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
                  padding: const EdgeInsets.only(top: 150),
                  child:    _isAdLoaded == true ? Container(
                      width: _bannerAd.size.width.toDouble(),
                      height: _bannerAd.size.height.toDouble(),
                      child: token == null ?  AdWidget(ad: _bannerAd):
                          SizedBox()
                  ): SizedBox(),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Obx(() {
                      if (teamController.isLoading.value) {
                        return const CircularProgressIndicator();
                      }
                      else if (teamController.viphistory.isEmpty) {
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
                          itemCount: teamController.viphistory.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  if(token == null){
                                    _interstitialAd.show();
                                  }
                                  Get.to(TeamDetails(
                                    home_strTeam: teamController.viphistory[index]
                                        .homeTeamId.strTeam.toString(),
                                    home_strTeamBadge:
                                    teamController.viphistory[index]
                                        .homeTeamId.strTeamBadge.toString(),
                                    away_strTeam: teamController.viphistory[index]
                                        .awayTeamId.strTeam.toString(),
                                    away_strTeamBadge:
                                    teamController.viphistory[index]
                                        .awayTeamId.strTeamBadge.toString(),
                                    strStadium: teamController.viphistory[index]
                                        .homeTeamId.strStadium.toString(),
                                    match_tips: teamController.viphistory[index]
                                        .matchTips,
                                    strStadiumThumb:
                                    teamController.viphistory[index]
                                        .homeTeamId.strStadiumThumb.toString(),
                                    status: teamController.viphistory[index].status,
                                    result: teamController.viphistory[index].result,
                                  ));
                                },
                                child: Card(
                                  elevation: 4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                teamController.viphistory[index].homeTeamId.strTeamShort.toString(),
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
                                                    .viphistory[index]
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
                                          if(teamController.viphistory[index].status == 'win')
                                            const Icon(Icons.check_circle,color: Colors.green,)
                                          else if(teamController.viphistory[index].status == 'lose')
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
                                                    .viphistory[index]
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
                                                teamController.viphistory[index]
                                                    .awayTeamId.
                                                strTeamShort ??
                                                    teamController
                                                        .viphistory[index]
                                                        .awayTeamId.
                                                    strTeam.toString(),
                                                style: GoogleFonts.acme(
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(teamController.viphistory[index]
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
