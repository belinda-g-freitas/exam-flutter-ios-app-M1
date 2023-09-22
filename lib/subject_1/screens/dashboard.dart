import 'dart:math';
import 'package:belinda_freitas_examen/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:belinda_freitas_examen/subject_1/screens/rubric.dart';
import 'package:belinda_freitas_examen/subject_1/widgets/custom_tiles.dart';

const List<String> _titles = ['EXAMS', 'PROJECTS', 'CLASSES', 'SPORTS', 'GENERAL'];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _now = DateTime.now();
  final List<Map> _classes = [
    {'time': ' 4 - 4:30PM', 'room': '501', 'course': 'CS4512 - Theory of computer', 'ongoing': true},
    {'time': ' 4:40 - 5:20PM', 'room': '505', 'course': 'CS9215 - Programming & algorithms', 'ongoing': false},
  ];
  final List<Map> _cards = [
    {'icon': Icons.speaker, 'text': 'Announcements', 'color': const Color(0xFF3CD8A1)},
    {'icon': Icons.calendar_today, 'text': 'My Calendar', 'color': red},
    {'icon': CupertinoIcons.book_fill, 'text': 'Assignments', 'color': Colors.deepPurple},
    {'icon': CupertinoIcons.news_solid, 'text': 'Exams', 'color': Colors.blue},
    {'icon': Icons.work, 'text': 'Classes', 'color': Colors.orange[200]},
    {'icon': CupertinoIcons.rectangle_stack_fill, 'text': 'Projects', 'color': Colors.lightGreenAccent[700]},
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xfff3f3f9),
      drawer: const Drawer(),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            height: 100, //92
            width: width,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffd31f00), Color(0xffcb3a3a)],
                  stops: [.5, 1],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: AppBar(
                leading: Builder(builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                }),
                title: const Text('UniStudy'),
                actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
              ),
            ),
          ),
          Positioned(
            top: 110,
            width: width,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 35),
                  color: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('TODAY\'S TIMELINE', style: TextStyle(color: customGrey, fontSize: 10)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          '${MaterialLocalizations.of(context).formatMediumDate(_now)}, ${_now.year}',
                          style: const TextStyle(fontSize: 13.5),
                        ),
                      ),
                      Container(
                        height: 100,
                        margin: const EdgeInsets.only(top: 10),
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: _classes.length,
                          itemBuilder: (_, i) => CourseTile(courses: _classes[i], onTap: () {}),
                          separatorBuilder: (_, __) => const SizedBox(width: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 15),
                      itemCount: _cards.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 125,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (_, i) => CardTile(
                        rubrics: _cards[i],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RubricScreen(title: _cards[i]['text'])),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // top menu
          Positioned(
            top: 85, //60
            height: 60,
            right: -15,
            width: width,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: white,
                boxShadow: const [BoxShadow(color: Color(0x3AD3D3D3), offset: Offset(1, 15), blurRadius: 25)],
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 15),
                itemCount: _titles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) => InkWell(
                  onTap: () {},
                  hoverColor: shadowColor.withOpacity(.5),
                  child: Container(
                    height: 50,
                    width: 85,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${pow(i + 1, 3)}', style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 2),
                        Text(_titles[i], style: const TextStyle(color: customGrey, fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
