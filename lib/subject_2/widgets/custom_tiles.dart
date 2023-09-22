import 'dart:math';
import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.index, required this.onTap});
  final String title;
  final int index;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: const Color(0x2FB7B7B7), borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w600)),
            Row(
              children: [
                const Icon(Icons.tv, color: grey, size: 15),
                Text('0/${Random().nextInt(10) + 1}', style: const TextStyle(color: grey, fontSize: 11))
              ],
            ),
            CircleAvatar(backgroundImage: AssetImage('assets/images/img$index.png'))
          ],
        ),
      ),
    );
  }
}
