import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/subject_1/subject_one.dart';
import 'package:belinda_freitas_examen/subject_2/subject_two.dart';
import 'package:belinda_freitas_examen/subject_3/subject_three.dart';
import 'package:belinda_freitas_examen/constants.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen FREITAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: transparent,
          titleTextStyle: TextStyle(color: white, fontSize: 15),
          actionsIconTheme: IconThemeData(color: white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UIChoice(),
    );
  }
}

class UIChoice extends StatelessWidget {
  const UIChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f9),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'CHOOSE A DESIGN',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  shadows: [BoxShadow(color: Color(0x809B85FC), offset: Offset(7, 7), blurRadius: 5)],
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectOne())),
                borderRadius: BorderRadius.circular(5),
                child: Badge(
                  label: const Text(' 1 '),
                  backgroundColor: Colors.blue,
                  largeSize: 20,
                  offset: const Offset(9, -9),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(color: Color(0x809B85FC), offset: Offset(7, 7), blurRadius: 5)],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: black, width: .5),
                          image: const DecorationImage(image: AssetImage('$imgPath/subject1.png'), fit: BoxFit.cover),
                        ),
                      ),
                      const Text('Subject 1', style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectTwo())),
                borderRadius: BorderRadius.circular(5),
                child: Badge(
                  label: const Text(' 2 '),
                  backgroundColor: Colors.blue,
                  largeSize: 20,
                  offset: const Offset(9, -9),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(color: Color(0x809B85FC), offset: Offset(7, 7), blurRadius: 5)],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: black, width: .5),
                          image: const DecorationImage(image: AssetImage('$imgPath/subject2.png'), fit: BoxFit.cover),
                        ),
                      ),
                      const Text('Subject 2', style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SubjectThree())),
                borderRadius: BorderRadius.circular(5),
                child: Badge(
                  label: const Text(' 3 '),
                  backgroundColor: Colors.blue,
                  largeSize: 20,
                  offset: const Offset(9, -9),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(color: Color(0x809B85FC), offset: Offset(7, 7), blurRadius: 5)],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: black, width: .5),
                          image: const DecorationImage(image: AssetImage('$imgPath/subject3.jpg'), fit: BoxFit.cover),
                        ),
                      ),
                      const Text('Subject 3', style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
