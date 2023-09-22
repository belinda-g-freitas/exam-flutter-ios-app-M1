import 'package:belinda_freitas_examen/subject_2/screens/choose_category.dart';
import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';

class SubjectTwo extends StatefulWidget {
  const SubjectTwo({super.key});

  @override
  State<SubjectTwo> createState() => _SubjectTwoState();
}

class _SubjectTwoState extends State<SubjectTwo> {
  final PageController _pageController = PageController(viewportFraction: .7);
  final List<Map> _data = [];
  final Map<String, String> _countries = {
    'Japanese': '🇯🇵',
    'Indian': '🇮🇳',
    'Greek': '🇬🇷',
    'Italian': '🇮🇹',
    'Arabic': '🇦🇪',
    'French': '🇫🇷',
    'Chinese': '🇨🇳',
    'Russian': '🇷🇺',
    'German': '🇩🇪'
  };
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {});
    int i = 0;
    _countries.forEach((k, v) {
      _data.add({'img': '$imgPath/img${i + 1}.png', 'country': k, 'flag': v});
      i += 1;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Select 1 of 9 languages', style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).iconTheme.color)),
      ),
      body: PageView.builder(
        itemCount: 9,
        controller: _pageController,
        onPageChanged: (value) => setState(() => _index = value),
        itemBuilder: (_, i) {
          bool active = i == _index;

          return Column(
            children: [
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                margin: active
                    ? _index == 0
                        ? const EdgeInsets.only(right: 15)
                        : (_index == 8 ? const EdgeInsets.only(left: 15) : const EdgeInsets.symmetric(horizontal: 15))
                    : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: grey,
                        border: Border.all(color: grey, width: .5),
                        image: DecorationImage(image: AssetImage(_data[i]['img']), fit: BoxFit.fill),
                        shape: BoxShape.circle,
                      ),
                      // height: (!_pageController.hasClients || _index != _pageController.page ? 20 : 30) * 2,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Visibility(visible: !active, child: Center(child: Text(_data[i]['flag']))),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: active,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_data[i]['flag']),
                          Text(_data[i]['country'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 19))
                        ],
                      ),
                      const Text(
                        'Incididunt consequat culpa ipsum est velit et commodo tempor adipisicing occaecat aliqua anim labore.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        shape: const CircleBorder(),
                        color: Colors.pink[400],
                        elevation: 0,
                        child: const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.play_arrow_rounded, color: white)),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.schedule, color: shadowColor, size: 18),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('320 min', style: TextStyle(color: shadowColor, fontSize: 10)),
                          ),
                          Icon(Icons.book, size: 18, color: shadowColor),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text('28 lessons', style: TextStyle(color: shadowColor, fontSize: 10)),
                          )
                        ],
                      ),
                      MaterialButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseCategory(title: _data[i]))),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.pink[400],
                        textColor: white,
                        elevation: 0,
                        height: 45,
                        minWidth: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Start learning ${_data[i]['country']}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const Icon(Icons.arrow_circle_right_rounded)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
