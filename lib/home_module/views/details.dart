import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sportapp/configurations/imports.dart';

class TeamDetails extends StatefulWidget {
  final String home_strTeam;
  final String home_strTeamBadge;
  final String away_strTeam;
  final String away_strTeamBadge;
  final String strStadiumThumb;
  final String match_tips;
  final String strStadium;
  final String? status;
  final String? result;

  TeamDetails(
      {Key? key,
      required this.home_strTeam,
      required this.home_strTeamBadge,
      required this.away_strTeam,
      required this.away_strTeamBadge,
      required this.strStadium,
      required this.match_tips,
      required this.strStadiumThumb,
      required this.status,
      required this.result})
      : super(key: key);

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
 GetStorage cache = GetStorage();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bannerAd.dispose();
  }

  void _initbanner(){
    _bannerAd = BannerAd(
        size: AdSize.banner,
        // adUnitId: '',
        adUnitId: 'ca-app-pub-4493845659843818/6951563026',
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MobileAds.instance.initialize();
    _initbanner();
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
                  child: CachedNetworkImage(
                    imageUrl: widget.strStadiumThumb,
                    errorWidget: (context, url, error) => SizedBox(),
                  ),
                ),
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.orange.withOpacity(0.5),
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CachedNetworkImage(
                            width: 80,
                            fit: BoxFit.cover,
                            imageUrl: widget.home_strTeamBadge,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.home_strTeam,
                            style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Text(
                        'VS',
                        style: GoogleFonts.acme(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Column(
                        children: [
                          CachedNetworkImage(
                            width: 80,
                            fit: BoxFit.cover,
                            imageUrl: widget.away_strTeamBadge,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.away_strTeam,
                            style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        widget.strStadium,
                        style: GoogleFonts.abel(
                            fontSize: 20, color: Colors.yellow),
                      ))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              width: 380,
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Prediction :',
                      style: GoogleFonts.acme(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.match_tips,
                      style: GoogleFonts.abel(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              width: 380,
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Result :',
                      style: GoogleFonts.acme(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.result.toString(),
                      style: GoogleFonts.abel(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              width: 380,
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Status :',
                      style: GoogleFonts.acme(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    if (widget.status == 'win')
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    else if (widget.status == 'lose')
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      )
                    else
                      Text(
                        'Pending',
                        style: GoogleFonts.abel(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isAdLoaded == true ? Container(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: token == null ? AdWidget(
          ad: _bannerAd,
        ):SizedBox()
      ):const SizedBox()
    );
  }
}
