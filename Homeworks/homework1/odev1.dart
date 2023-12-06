import 'package:flutter/material.dart';

class Odev1 extends StatefulWidget {
  const Odev1({super.key});

  @override
  State<Odev1> createState() => _Odev1State();
}

class _Odev1State extends State<Odev1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.app_registration_rounded,
          weight: 30,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Hasta kayıt ekleme",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
        elevation: 0.0,
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
        child: Column(
          children: [
            record(string: "name"),
            record(string: "last name"),
            record(string: "TC"),
            record(string: "Adress"),
            record(string: "phone"),
            record(string: "Email"),
            const SizedBox(
              height: 17,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.amber,
                  onPressed: () {},
                  height: 50,
                  minWidth: 50,
                  child: const Text("kaydet",
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(children: [
                  tablo(),
                  tablo(),
                  tablo(),
                  tablo(),
                ]),
                Column(children: [
                  tablo(),
                  tablo(),
                  tablo(),
                  tablo(),
                ]),
                Column(children: [
                  tablo(),
                  tablo(),
                  tablo(),
                  tablo(),
                ]),
                Column(children: [
                  tablo(),
                  tablo(),
                  tablo(),
                  tablo(),
                ]),
                Column(children: [
                  tablo(),
                  tablo(),
                  tablo(),
                  tablo(),
                ]),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget record({required String string}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text("$string: ",
                    style: const TextStyle(color: Colors.black, fontSize: 20))),
            Expanded(
                flex: 3,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter your $string: ",
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.black)),
                      border: const OutlineInputBorder()),
                ))
          ],
        ),
        const SizedBox(
          height: 13,
        )
      ],
    );
  }

  Widget tablo() {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Expanded(
          child: Container(
        height: 40,
        width: 70,
        color: Colors.white,
      )),
    );
  }
}
