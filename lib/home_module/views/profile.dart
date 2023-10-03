import 'package:sportapp/auth_module/model/user_model.dart';
import 'package:sportapp/auth_module/views/login.dart';
import 'package:sportapp/configurations/imports.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _days = TextEditingController();
  GetStorage cache = GetStorage();

  @override
  Widget build(BuildContext context) {
    String? token;
    if (cache.read('user') == null) {
      _name.text = '1.0.1';
      _lname.text = '-';
      _email.text = '-';
      _days.text = '';
    }
    else{
      var user = User.fromJson(cache.read('user'));
      token = cache.read('token');
      print(token);
      // user.user.email ??
      _name.text = _name.text = '1.0.0';
      _lname.text = user.lastName.toString() ?? '-';
      _email.text = user.email.toString() ?? '-';
      _days.text = '';
    }
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3ED),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 400,
                  height: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.orange,
                        Colors.black,
                      ])),
                ),
                Image(image: AssetImage('assets/logo2.png'))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                enabled: false,
                controller: _name,
                decoration: const InputDecoration(
                    labelText: 'App Version',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ))),
              ),
            ),
            // const SizedBox(height: 2,),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: TextField(
            //     enabled: false,
            //     controller: _lname,
            //     decoration: const InputDecoration(
            //         labelText: 'Last Name',
            //         enabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //           color: Colors.white,
            //           width: 2.0,
            //         ))),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                enabled: false,
                controller: _email,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ))),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: TextField(
            //     enabled: false,
            //     controller: _days,
            //     decoration: const InputDecoration(
            //         labelText: 'Coins',
            //         enabledBorder: OutlineInputBorder(
            //             borderSide: BorderSide(
            //           color: Colors.white,
            //           width: 2.0,
            //         ))),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.orange,
                      Colors.black,
                    ])),
                child: TextButton(
                    onPressed: () {
                      cache.remove('token');
                      cache.remove('user');
                      Get.offAll(const Login());
                    },
                    child: token != null
                        ? const Text(
                            'Log Out',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : const Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
