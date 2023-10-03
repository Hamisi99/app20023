import 'package:sportapp/Widgets_module/views/navigations.dart';
import 'package:sportapp/auth_module/controllers/auth_controller.dart';
import 'package:sportapp/auth_module/model/user_model.dart';
import 'package:sportapp/auth_module/providers/user_provider.dart';
import 'package:sportapp/auth_module/views/register.dart';
import 'package:sportapp/configurations/imports.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthController authController = AuthController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const Image(
                    image: AssetImage(
                        'assets/sven-kucinic-Z0KjmjxUsKs-unsplash.jpg')),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  color: Colors.black.withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280.0),
                  child: Center(
                    child: SizedBox(
                      height: 400,
                      width: 330,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Form(
                              key: authController.formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    child: TextFormField(
                                      controller: authController.email,
                                      validator: (value) {
                                        // add email validation
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        bool emailValid = RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value);
                                        if (!emailValid) {
                                          return 'Please enter a valid email';
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        enabled: true,
                                        labelText: 'Email',
                                        hintText: 'Enter your email',
                                        // fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: Colors.orange,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.orange,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextFormField(
                                      controller: authController.password,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        if (value.length < 6) {
                                          return 'Password must be at least 6 characters';
                                        }
                                        return null;
                                      },
                                      obscureText: !_isPasswordVisible,
                                      decoration: InputDecoration(
                                          labelText: 'Password',
                                          hintText: 'Enter your password',
                                          prefixIcon: const Icon(
                                            Icons.lock_outline_rounded,
                                            color: Colors.orange,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.orange,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          suffixIcon: IconButton(
                                            icon: Icon(_isPasswordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: Obx(()=>ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          child:  Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: authController.isLoading == false.obs ? const Text(
                                                'Sign in',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                              ):const CircularProgressIndicator(color: Colors.white) ),
                                          onPressed: () {
                                            if(authController.formKey.currentState!.validate()) {
                                              // print(User(password: authController.password.text, email: authController.email.text));
                                              var data = {
                                                "email":authController.email.text,
                                                "password":authController.password.text
                                              };
                                              UserProvider().login(data);



                                            }

                                          }),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        // Get.to(const Register());
                                      },
                                      child: RichText(
                                        text: const TextSpan(children: [
                                          TextSpan(
                                              text: "Don't have an account? ",
                                              style: TextStyle(
                                                  color: Colors.orange)),
                                          TextSpan(text: 'Sign up')
                                        ]),
                                      )),
                                   const SizedBox(height: 10,),
                                   InkWell(
                                    onTap: (){
                                      Get.to(const Navigation());
                                    },
                                      child: const Text("Skip",
                                          style:
                                              TextStyle(color: Colors.orange))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).asGlass(clipBorderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
