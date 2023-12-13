import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool obscuretext;
  const TextForm(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.obscuretext});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  late TextEditingController controller;
  late String hinttext;
  late bool obscuretext;

  @override
  void initState() {
    super.initState();
    hinttext = widget.hinttext;
    controller = widget.controller;
    k = widget.obscuretext;
  }

  bool _isObscure = true;
  bool k = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: k ? _isObscure : false,
      decoration: InputDecoration(
          suffixIconColor: Colors.black,
          suffixIcon: k
              ? IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.black45),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
    );
  }
}
