// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class Calculateproject1 extends StatefulWidget {
  const Calculateproject1({super.key});

  @override
  State<Calculateproject1> createState() => _CalculateprojectState();
}

class _CalculateprojectState extends State<Calculateproject1> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  dynamic interest;
  dynamic total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.notes,
          weight: 30,
          color: Colors.white,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info,
              weight: 30,
              color: Colors.white,
            ),
          )
        ],
        elevation: 0.0,
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey[200],
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                height: 170,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                    )),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fixed Deposit",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Text(
                      "Calculator",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inputForm(
                        title: "Deposit Amout:",
                        controller: _controller1,
                        hinttext: "e.g 20000"),
                    inputForm(
                        title: "Annual Interest Rate(%):",
                        controller: _controller2,
                        hinttext: "e.g 3"),
                    inputForm(
                        title: "Period(in month)",
                        controller: _controller3,
                        hinttext: "e.g 3"),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        calculation();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25)),
                        child: const Text(
                          "CALCULATE",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    interest != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Result:",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "Enterest :RM" + interest.toStringAsFixed(2),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "Total :RM" + total.toStringAsFixed(2),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(height: 10)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  void calculation() {
    final calinterestrate = (double.parse(_controller2.text) / 100 / 12) *
        int.parse(_controller3.text);
    final calinterest = calinterestrate * int.parse(_controller1.text);
    setState(() {
      interest = calinterest;
      total = int.parse(_controller1.text) + interest;
    });
  }
}
