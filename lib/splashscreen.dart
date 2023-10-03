import 'package:sportapp/Widgets_module/views/navigations.dart';
import 'package:sportapp/auth_module/views/login.dart';
import 'package:sportapp/configurations/imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetStorage cache = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2),() async{
      // if(cache.read('token') == null){
      //   Get.offAll(const Login());
      // }
      // else{
      //   Get.offAll(const Navigation());
      // }
      Get.offAll(const Navigation());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Center(
            child: Image.asset
              ('assets/logo2.png'),
          ))
        ],
      ),
    );
  }
}
