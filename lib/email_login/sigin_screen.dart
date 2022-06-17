import 'package:auth/colors.dart';
import 'package:auth/email_login/auth_method.dart';
import 'package:auth/email_login/global.dart';
import 'package:auth/email_login/home_page.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _isloading = false;

  signInUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethod().signMethod(
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
    );
    setState(() {
      _isloading = false;
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
        //backgroundColor: Colors.black,
        // appBar: AppBar(title: Text('SignIn')),
        body: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            SizedBox(
              // width: 350,
              // height: 0,
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
                  controller: usernameController,
                  decoration: const InputDecoration(label: Text('Username')),
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
                  controller: emailController,
                  decoration: InputDecoration(label: Text('Email address')),
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
                  controller: passwordController,
                  decoration: InputDecoration(label: Text('Password')),
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
                child: const TextField(
                  decoration: InputDecoration(label: Text('Re-enter Password')),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () async {
                  String res = await AuthMethod().signMethod(
                    email: emailController.text,
                    password: passwordController.text,
                    username: usernameController.text,
                  );
                  print(res);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: _isloading
                      ? CircularProgressIndicator(
                          color: Colors.green,
                          backgroundColor: Colors.green,
                        )
                      : Text(
                          'Sign In',
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
                Text("Already have an account?"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    ' Login',
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
                    onPressed: () {}, icon: Icon(Icons.apple_sharp, size: 30)),
                SizedBox(width: 15),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.g_mobiledata, size: 45)),
              ],
            )
          ],
        ),
      ],
    ));
  }
}
