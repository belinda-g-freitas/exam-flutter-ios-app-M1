import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:belinda_freitas_examen/subject_3/screens/courses_sceen.dart';
import 'package:belinda_freitas_examen/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _index = 0;

  Widget card({
    required Color color,
    required double height,
    required String img,
    required String title,
    required String subtitle,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(20))),
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 12)),
                Text(subtitle, style: const TextStyle(color: white, fontSize: 11)),
              ],
            ),
            Image.asset(img),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f9),
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 9),
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('$imgPath/home_user.png'), fit: BoxFit.cover),
                boxShadow: const [BoxShadow(color: Color(0x4B9B27B0), blurRadius: 3, offset: Offset(2, 2))],
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hey Ashik,', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, height: 1, fontSize: 24)),
                  const SizedBox(height: 10),
                  const Text('Find a course you want to learn', textAlign: TextAlign.left, style: TextStyle(fontSize: 16, height: 1)),
                  const SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: white,
                      filled: true,
                      hintText: 'Search for anything',
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: const Color(0xFF9A85FC),
                          height: 55,
                          minWidth: 55,
                          child: const Icon(CupertinoIcons.search, size: 27, color: white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Category', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'See all',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: shadowColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // cards
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            card(
                              color: const Color(0xFF9A85FC),
                              height: 170,
                              img: '$imgPath/design.png',
                              title: 'UI UX Design',
                              subtitle: '54 courses',
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CoursesScreen(title: 'UI UX Design', img: '$imgPath/design.png')),
                              ),
                            ),
                            card(
                              color: const Color(0x952195F3),
                              height: 155,
                              img: '$imgPath/photography.png',
                              title: 'Photography',
                              subtitle: '103 courses',
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CoursesScreen(title: 'Photography', img: '$imgPath/photography.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            card(
                              color: const Color(0xA54CAF70),
                              height: 155,
                              img: '$imgPath/finance.png',
                              title: 'Finance',
                              subtitle: '32 courses',
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CoursesScreen(title: 'Finance', img: '$imgPath/finance.png')),
                              ),
                            ),
                            card(
                              color: const Color(0x8EE91E58),
                              height: 170,
                              img: '$imgPath/marketing.png',
                              title: 'Marketing',
                              subtitle: '54 courses',
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CoursesScreen(title: 'Marketing', img: '$imgPath/marketing.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Center(child: Icon(CupertinoIcons.home)),
          const Center(child: Icon(CupertinoIcons.square_grid_2x2)),
          const Center(child: Icon(Icons.favorite_border)),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 52,
        selectedIndex: _index,
        onDestinationSelected: (value) {
          setState(() => _index = value);
          _pageController.animateToPage(value, duration: const Duration(milliseconds: 350), curve: Curves.linear);
        },
        destinations: const [
          NavigationDestination(icon: Icon(CupertinoIcons.home, color: Colors.black54), label: ''),
          NavigationDestination(icon: Icon(CupertinoIcons.square_grid_2x2, color: Colors.black54), label: ''),
          NavigationDestination(icon: Icon(Icons.favorite_border, color: Colors.black54), label: ''),
          NavigationDestination(icon: Icon(Icons.person_outline, color: Colors.black54), label: ''),
        ],
      ),
    );
  }
}
