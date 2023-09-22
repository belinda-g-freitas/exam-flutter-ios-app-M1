import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';
import 'package:belinda_freitas_examen/subject_3/screens/main_screen.dart';

class SubjectThree extends StatefulWidget {
  const SubjectThree({super.key});

  @override
  State<SubjectThree> createState() => _SubjectThreeState();
}

class _SubjectThreeState extends State<SubjectThree> {
  int _activePage = 0;

  List<Widget> indicators(int length, currentIndex) {
    return List<Widget>.generate(
      length,
      (i) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(3),
          width: i == currentIndex ? 21 : 5.9,
          height: 5.9,
          decoration: BoxDecoration(
            color: currentIndex == i ? Colors.pink : transparent,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: currentIndex == i ? Colors.pink : grey),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('$imgPath/landing.png'),
            const Column(
              children: [
                Text('Online School', textAlign: TextAlign.center, style: TextStyle(fontSize: 35, height: 1, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Ullamco et sint sit adipisicing consectetur mollit adipisicing veniam culpa incididunt magna.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: indicators(3, _activePage)),
                MaterialButton(
                  onPressed: () {
                    _activePage < 2
                        ? setState(() => _activePage += 1)
                        : Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xFF9A85FC),
                  height: 55,
                  minWidth: 150,
                  child: Text(_activePage < 2 ? 'Next' : 'Get Started', style: const TextStyle(fontSize: 16, color: white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
