import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: const CircleAvatar(
        radius: 60, // هذا يحدد نصف قطر الصورة المستديرة
        backgroundImage: NetworkImage(
          "https://i.pinimg.com/564x/3d/28/30/3d2830f396b067447b135942d7d1f8aa.jpg",
        ),
      ),
    );
  }
}
