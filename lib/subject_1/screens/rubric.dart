import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';
import 'package:belinda_freitas_examen/subject_1/widgets/custom_tiles.dart';

const List<String> _titles = ['All Items', 'Exams', 'Classes', 'General', 'Sports'];

class RubricScreen extends StatefulWidget {
  const RubricScreen({super.key, required this.title});

  final String title;

  @override
  State<RubricScreen> createState() => _RubricScreenState();
}

class _RubricScreenState extends State<RubricScreen> {
  int _currentIndex = 0;
  final Map<String, List<Map>> _rubrics = {};
  List _list = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _titles.length; i++) {
      if (i > 0) {
        switch (_titles[i]) {
          case 'Exams':
            _rubrics[_titles[i]] = [
              {'title': 'Exams', 'text': 'Laboris qui veniam excepteur minim nostrud aliqua pariatur cillum.', 'color': Colors.blue},
              {'title': 'Exams', 'text': 'Adipisicing duis proident est reprehenderit.', 'color': Colors.blue}
            ];
            break;
          case 'Classes':
            _rubrics[_titles[i]] = [
              {'title': 'Classes', 'text': 'Excepteur proident consequat ut ex adipisicing mollit quis adipisicing.', 'color': Colors.orange[200]},
              {'title': 'Classes', 'text': 'Cillum magna sit do consequat.', 'color': Colors.orange[200]}
            ];
            break;
          case 'General':
            _rubrics[_titles[i]] = [
              {'title': 'General', 'text': 'Ea est irure proident ut aute.', 'color': red},
              {'title': 'General', 'text': 'Dolor consequat nulla sit qui duis enim sit.', 'color': red}
            ];
            break;
          case 'Sports':
            _rubrics[_titles[i]] = [
              {'title': 'Sports', 'text': 'Ipsum occaecat sit mollit voluptate nisi reprehenderit id voluptate nulla.', 'color': Colors.deepPurple},
              {'title': 'Sports', 'text': 'Nostrud commodo officia duis ea quis Lorem quis nostrud anim.', 'color': Colors.deepPurple}
            ];
            break;
          default:
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (_currentIndex == 0) {
      _list = [];
      _rubrics.forEach((_, v) => _list.addAll(v));
    } else {
      _list = _rubrics[_titles[_currentIndex]]!;
    }

    return Scaffold(
      backgroundColor: const Color(0xfff3f3f9),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            height: 105, //77,
            width: width,
            child: AppBar(leading: const BackButton(color: white), title: Text(widget.title), backgroundColor: const Color(0xff2f3641)),
          ),
          Positioned(
            top: 130,//120,
            width: width,
            bottom: 0,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              itemCount: _list.length,
              itemBuilder: (_, i) {
                _list.shuffle();
                return DetailCard(details: _list[i], index: i + 1);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 15),
            ),
          ),
          // top menu
          Positioned(
            top: 85, //60,
            height: 35,
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
                itemBuilder: (_, i) {
                  bool yes = _currentIndex == i;

                  return InkWell(
                    onTap: () => setState(() => _currentIndex = i),
                    hoverColor: shadowColor.withOpacity(.5),
                    child: Container(
                      height: 50,
                      width: 65,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _titles[i],
                            style: TextStyle(color: yes ? null : grey, fontWeight: yes ? FontWeight.w700 : FontWeight.w400, fontSize: 11),
                          ),
                          const SizedBox(height: 2),
                          Container(height: 1.5, width: 7, color: yes ? const Color(0xff2f3641) : null),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
