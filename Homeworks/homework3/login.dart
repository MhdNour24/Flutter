import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/logo.dart';
import 'package:flutter_application_2/components/textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
            const Text("Login",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 10,
            ),
            const Text("Login to continue using the App",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
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
                  "Login",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              height: 60,
              color: const Color(0xFFFAF0E6),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login with Google ",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/564x/39/21/6d/39216d73519bca962bd4a01f3e8f4a4b.jpg"),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't you have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("Signup");
                  },
                  child: const Text(
                    "Register",
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
