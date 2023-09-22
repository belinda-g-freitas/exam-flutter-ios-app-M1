import 'package:belinda_freitas_examen/subject_3/widgets/course_tile.dart';
import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key, required this.title, required this.img});

  final String title, img;

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  bool _isFav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f9),
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios, size: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.img, height: 200, fit: BoxFit.cover),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                width: 33,
                height: 5,
                decoration: const ShapeDecoration(shape: StadiumBorder(), color: shadowColor),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text('Course content', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (_, i) => const CourseTile(),
                separatorBuilder: (_, __) => const SizedBox(height: 5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () => setState(() => _isFav = !_isFav),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: white,
                    height: 55,
                    minWidth: 65,
                    child: Icon(_isFav ? Icons.favorite : Icons.favorite_border, color: Colors.pink, size: 28),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    flex: 2,
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: const Color(0xFF9A85FC),
                      height: 55,
                      minWidth: 150,
                      child: const Text('Buy now', style: TextStyle(fontSize: 12.9, fontWeight: FontWeight.normal, color: white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
