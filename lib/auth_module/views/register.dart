import 'package:sportapp/auth_module/views/login.dart';
import 'package:sportapp/configurations/imports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  padding: const EdgeInsets.only(top: 240.0),
                  child: Center(
                    child: SizedBox(
                      height: 520,
                      width: 330,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Form(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    child: TextFormField(
                                      validator: (value) {
                                        // add email validation
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your first name';
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        enabled: true,
                                        labelText: 'First Name',
                                        hintText: 'Enter your first name',
                                        // fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: const Icon(
                                          Icons.person,
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
                                      validator: (value) {
                                        // add email validation
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Last name';
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        enabled: true,
                                        labelText: 'Last Name',
                                        hintText: 'Enter your Last name',
                                        // fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: const Icon(
                                          Icons.person,
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
                                        prefixIcon: const Icon(
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
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        onPressed: () {}),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(Login());
                                      },
                                      child: RichText(
                                        text: const TextSpan(children: [
                                          TextSpan(
                                              text: "I've an account? ",
                                              style: TextStyle(
                                                  color: Colors.orange)),
                                          TextSpan(text: 'Sign In')
                                        ]),
                                      )),
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
