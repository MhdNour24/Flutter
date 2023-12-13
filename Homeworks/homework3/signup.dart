import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/logo.dart';
import 'package:flutter_application_2/components/textformfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ListView(
          children: [

            const Logo(),
            const Text("Register",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            const Text("Enter your personal information",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
            const SizedBox(
              height: 15,
            ),
            const Text("User Name",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFAF0E6),
                    borderRadius: BorderRadius.circular(40)),
                child: TextForm(
                    hinttext: "Enter your username",
                    controller: username,
                    obscuretext: false)),
            const SizedBox(
              height: 15,
            ),
            const Text("Email",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFAF0E6),
                    borderRadius: BorderRadius.circular(40)),
                child: TextForm(
                    hinttext: "Enter your email",
                    controller: email,
                    obscuretext: false)),
            const SizedBox(
              height: 15,
            ),
            const Text("Password",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFAF0E6),
                    borderRadius: BorderRadius.circular(40)),
                child: TextForm(
                  obscuretext: true,
                  controller: password,
                  hinttext: "Enter your password",
                )),
            const SizedBox(
              height: 15,
            ),
            const Text("Confirm Password",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFAF0E6),
                    borderRadius: BorderRadius.circular(40)),
                child: TextForm(
                  obscuretext: true,
                  controller: confirmPassword,
                  hinttext: "Enter confirm password",
                )),
            Container(
              alignment: Alignment.topRight,
              child: MaterialButton(
                onPressed: () {},
                child: const Text("Forget password?"),
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xFFFAF0E6),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  "SignUp",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do you have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
