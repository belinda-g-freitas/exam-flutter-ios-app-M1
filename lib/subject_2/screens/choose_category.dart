import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:belinda_freitas_examen/constants.dart';
import 'package:belinda_freitas_examen/subject_2/screens/category_screen.dart';
import 'package:belinda_freitas_examen/subject_2/widgets/custom_tiles.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({Key? key, required this.title}) : super(key: key);

  final Map title;

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title['flag'] + ' ' + widget.title['country'], style: TextStyle(color: Theme.of(context).iconTheme.color)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Choose', style: TextStyle(fontWeight: FontWeight.w700, height: 1, fontSize: 25)),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const ShapeDecoration(shape: StadiumBorder(), color: Colors.blue),
                      height: 25,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(CupertinoIcons.shuffle, color: white, size: 15),
                          Text('SHUFFLE BABY', style: TextStyle(color: white, fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Text('your category', style: TextStyle(color: shadowColor, height: 1, fontSize: 25)),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Culture', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.schedule, size: 15, color: shadowColor),
                      Text('  320 min', style: TextStyle(fontSize: 11, color: shadowColor))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: 3,
                  itemBuilder: (_, i) {
                    var list = ['Cooking', 'Culture', 'Literature'];
                    return CustomCard(
                      title: list[i],
                      index: 9,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryScreen(category: {'img': 'assets/images/img9.png', 'category': list[i]}, language: widget.title),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Travel', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.schedule, size: 15, color: shadowColor),
                      Text('  38 min', style: TextStyle(fontSize: 11, color: shadowColor))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: 3,
                  itemBuilder: (_, i) {
                    var list = ['Tourism', 'Lodging', 'Transport'];
                    return CustomCard(
                      title: list[i],
                      index: 8,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                              category: {'img': 'assets/images/img8.png', 'category': list[i]},
                              language: widget.title,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Events', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.schedule, size: 15, color: shadowColor),
                      Text('  72 min', style: TextStyle(fontSize: 11, color: shadowColor))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: 3,
                  itemBuilder: (_, i) {
                    var list = ['Recreation', 'Parties', 'Theatre'];
                    return CustomCard(
                      title: list[i],
                      index: 6,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                              category: {'img': 'assets/images/img6.png', 'category': list[i]},
                              language: widget.title,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
