import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:belinda_freitas_examen/constants.dart';

class CourseTile extends StatefulWidget {
  const CourseTile({super.key});

  @override
  State<CourseTile> createState() => _CourseTileState();
}

class _CourseTileState extends State<CourseTile> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(CupertinoIcons.book_fill, color: grey, size: 15),
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Sit enim labore magna aute Lorem.',
        style: TextStyle(color: _selected ? grey : null, fontWeight: _selected ? null : FontWeight.w500, height: 1),
      ),
      subtitle: Text(
        '${MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay.now(), alwaysUse24HourFormat: true)} mins',
        style: const TextStyle(height: 1, color: grey),
      ),
      trailing: MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        onPressed: () => setState(() => _selected = !_selected),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: _selected ? const Color(0xFF9A85FC) : const Color(0x619B85FC),
        height: 45,
        minWidth: 40,
        child: const Icon(Icons.play_arrow_rounded, size: 27, color: white),
      ),
    );
  }
}
