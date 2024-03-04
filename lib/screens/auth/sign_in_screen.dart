import 'package:bltvt_mobile_veterinary/screens/main_menu/main_menu_screen.dart';
import 'package:bltvt_mobile_veterinary/services/authentication_service.dart';
import 'package:bltvt_mobile_veterinary/utils/colors.dart';
import 'package:bltvt_mobile_veterinary/utils/custom_style.dart';
import 'package:bltvt_mobile_veterinary/utils/dimensions.dart';
import 'package:bltvt_mobile_veterinary/utils/screen_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email;
  String password;
  bool rememberMe = false;
  bool isBusy = false;

  @override
  void initState() {
    savedCredentialsLoad();
    super.initState();
  }

  void savedCredentialsLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
      password = prefs.getString('password') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;
      emailController.text = email;
      passwordController.text = password;
    });
  }

  Future saveCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('rememberMe', rememberMe);
  }

  @override
Widget build(BuildContext context) {
  ScreenUtil.init(context);
  return Scaffold(
    backgroundColor: CustomColor.primaryColor,
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome2page.JPG'),
          fit: BoxFit.cover,
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: bodyWidget(context),
      ),
    ),
  );
}


  Widget bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              bottom: Dimensions.marginSize / 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        
                      ),
                      child: Hero(
                        tag: "logo-hero",
                        child: Image.asset(
                          'assets/images/bulutvet-logo-white.png',
                          fit: BoxFit.contain,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.heightSize * 1/4),
                Material(
                  elevation: 40.0,
                  shadowColor: CustomColor.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mail,
                          color: CustomColor.primaryColor,
                        ),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: Dimensions.largeTextSize,
                              fontWeight: FontWeight.normal,
                            ),
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (email) async {
                              // await login(email, context);
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Mail adresinizi giriniz";
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: const [
                              // LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.transparent,
                              hintStyle: CustomStyle.textStyle,
                              hintText: "E-Posta Adresiniz",
                              focusedBorder: CustomStyle.focusBorder
                                  .copyWith(borderSide: BorderSide.none),
                              enabledBorder: CustomStyle.focusErrorBorder
                                  .copyWith(borderSide: BorderSide.none),
                              focusedErrorBorder: CustomStyle.focusErrorBorder,
                              errorBorder: CustomStyle.focusErrorBorder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Material(
                  elevation: 40.0,
                  shadowColor: CustomColor.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lock_outline,
                          color: CustomColor.primaryColor,
                        ),
                        Expanded(
                          child: TextFormField(
                            obscureText: true,
                            style: TextStyle(
                                fontSize: Dimensions.largeTextSize,
                                fontWeight: FontWeight.normal),
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (password) async {
                              await login(
                                  emailController.value.text,
                                  passwordController.value.text,
                                  context);
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Şifrenizi giriniz";
                              } else {
                                return null;
                              }
                            },
                            inputFormatters: const [
                              // LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.transparent,
                              hintStyle: CustomStyle.textStyle,
                              hintText: "Şifreniz",
                              focusedBorder: CustomStyle.focusBorder
                                  .copyWith(borderSide: BorderSide.none),
                              enabledBorder: CustomStyle.focusErrorBorder
                                  .copyWith(borderSide: BorderSide.none),
                              focusedErrorBorder: CustomStyle.focusErrorBorder,
                              errorBorder: CustomStyle.focusErrorBorder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), const SizedBox(
                  
                ),  const SizedBox(height: Dimensions.heightSize * 1),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value;
                          });
                        },
                      ),
                      Text(
                        "Beni Hatırla",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.defaultTextSize,
                        ),
                      ),
                    ],
                  ),
                ), 
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [                                    
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            if (kDebugMode) {
                              emailController.text =
                                  "hasan.seremet@hotmail.com";
                              passwordController.text = "ferrari1";
                            }
                            if (emailController.value.text.isNotEmpty &&
                                passwordController.value.text.isNotEmpty) {
                              await login(emailController.value.text,
                                  passwordController.value.text, context);
                            } else {
                              Fluttertoast.showToast(
                                msg: "Lütfen giriş bilgilerini doldurunuz!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 29, 55, 201)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 54, 21, 130),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              "GİRİŞ YAP",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 54, 21, 130),
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                fontFamily: "OpenSans",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future login(String email, String password, BuildContext context) async {
    setState(() {
      isBusy = true;
    });

    var result = await authenticationService.login(email, password);

    setState(() {
      isBusy = false;
    });

    if (result.flActive) {
      if (rememberMe) {
        await saveCredentials(email, password);
      }
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MainMenuScreen()),
      );
    } else {
      Fluttertoast.showToast(
        msg: result.messageList.first.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
