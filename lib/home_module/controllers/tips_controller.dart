import 'package:sportapp/configurations/imports.dart';
import 'package:sportapp/home_module/models/app_versions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class TipsController extends GetxController{
  var tipsList = List<Tipsmodel>.empty(growable: true).obs;
  var tipsHistotyList = List<Tipsmodel>.empty(growable: true).obs;
  var appVersion = List<AppVersion>.empty(growable: true).obs;
  Rx<bool> isLoading = false.obs;
  var myAppVersion = '1.0.1';
  RxBool dialogIsShowing =true.obs;
  RxBool NoConnection =false.obs;

  void fetchtips(){
    TipsProvider().fetchTips().then((value){
      print(value);
      tipsList.value = value;
      // tipsList.clear();
      // tipsList.addAll(value);
      // print(value);
    });
  }


  void fetchtipsHistoty(){
    TipsProvider().fetchTipsHistoty().then((value){
      // print(value);
      tipsHistotyList.value = value;
      // tipsList.clear();
      // tipsList.addAll(value);
      // print(value);
    });
  }

  void fetchAppVersion(){
    TipsProvider().fetchAppVersion().then((value){
      // print(value);
      appVersion.value = value;
      // tipsList.clear();
      // tipsList.addAll(value);
      // print(value);
    });
  }



  void chechInternet()async{
    var connectivityResult = (Connectivity().checkConnectivity());
    if(connectivityResult ==  ConnectivityResult.none){
       NoConnection(true).obs;
    }
  }

}