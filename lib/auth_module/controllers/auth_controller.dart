import 'package:sportapp/configurations/imports.dart';

class AuthController extends GetxController{
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Rx<bool> isLoading = false.obs;
  String domain = "http://planettips.online/";


}