import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category, required this.language});
  final Map category, language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Center(child: Text('3/12', style: TextStyle(fontSize: 12))),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage(category['img']), radius: 15),
            const SizedBox(width: 5),
            Text(category['category'], style: TextStyle(color: Theme.of(context).iconTheme.color, fontWeight: FontWeight.w500)),
          ],
        ),
        actions: [CloseButton(color: Theme.of(context).iconTheme.color)],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - kToolbarHeight,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(language['flag'] + language['country'], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
              const SizedBox(height: 15),
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: 'Cupidatat duis mollit aute sit cupidatat deser', style: TextStyle(color: Colors.pink[400])),
                  const TextSpan(text: 'unt et non amet laboris. Dolor non tempor anim veniam et ipsum dolor consequat.')
                ]),
                textAlign: TextAlign.center,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {},
                shape: const CircleBorder(),
                color: Colors.pink[400],
                elevation: 0,
                child: const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.stop, color: white)),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: const Color(0x2FB7B7B7),
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.slow_motion_video_rounded, size: 22, color: black),
                      Text('Play slowly', style: TextStyle(fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(height: 1),
              const SizedBox(height: 25),
              const Text('🇺🇸 English', style: TextStyle(fontWeight: FontWeight.w700, height: 1, fontSize: 18)),
              const SizedBox(height: 15),
              const Text(
                'Quis aute non duis reprehenderit ad cillum labore reprehenderit cupidatat exercitation tempor.',
                style: TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: const Color(0x2FB7B7B7),
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.play_arrow, size: 22, color: black), Text('Play both', style: TextStyle(fontWeight: FontWeight.w600))],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.blueGrey[900],
                          textColor: white,
                          elevation: 0,
                          height: 55,
                          child: const Text('Previous'),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        flex: 2,
                        child: MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: Colors.pink[400],
                          textColor: white,
                          elevation: 0,
                          height: 55,
                          child: const Text('Next'),
                        ),
                      )
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
