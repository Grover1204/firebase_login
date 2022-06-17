import 'package:auth/colors.dart';
import 'package:auth/email_login/auth_method.dart';
import 'package:auth/email_login/global.dart';
import 'package:auth/email_login/home_page.dart';
import 'package:auth/email_login/sigin_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();

  TextEditingController pass = TextEditingController();

  bool _isloding = false;

  LoginUser() async {
    setState(() {
      _isloding = true;
    });
    String res = await AuthMethod().loginMethod(
      email: user.text,
      password: pass.text,
    );
    setState(() {
      _isloding = false;
    });
    if (res == 'success') {
      print(res);
      showSnackBar(context, res);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      // showSnackBar(context, res);
    } else {
      print(res);
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              SizedBox(
                // width: 100,
                // // height: 0,
                child: Image.asset(
                  'assets/company_logo.png',
                  width: 300,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 180),
                child: Text('- Desgined by grover'),
              ),
              const SizedBox(height: 80),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: user,
                    decoration: InputDecoration(label: Text('Username')),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: pass,
                    decoration: InputDecoration(label: Text('Password')),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    LoginUser();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomeScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: _isloding
                        ? CircularProgressIndicator()
                        : Text(
                            'Login',
                            style: TextStyle(
                              color: Appcolors.purple,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create an account?"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      ' Signin',
                      style: TextStyle(
                        color: Appcolors.purple,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.facebook, size: 30)),
                  SizedBox(width: 15),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.apple_sharp, size: 30)),
                  SizedBox(width: 15),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata, size: 45)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
