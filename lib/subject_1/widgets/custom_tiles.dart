import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';

class CourseTile extends StatefulWidget {
  const CourseTile({super.key, required this.courses, this.onTap});

  final Map courses;
  final void Function()? onTap;

  @override
  State<CourseTile> createState() => _CourseTileState();
}

class _CourseTileState extends State<CourseTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.courses['course'],
      child: InkWell(
        onTap: widget.onTap,
        onHover: (b) => setState(() => _hover = b),
        child: Container(
          height: 90,
          width: 220,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
          decoration: BoxDecoration(
            border: Border.all(color: shadowColor),
            color: _hover ? Theme.of(context).hoverColor : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(Icons.watch_later, size: 15, color: customGrey),
                  Text(widget.courses['time'], style: const TextStyle(color: grey, fontSize: 12)),
                  const SizedBox(width: 9),
                  const Icon(Icons.meeting_room, size: 15, color: customGrey),
                  Text('ROOM ${widget.courses['room']}', style: const TextStyle(color: customGrey, fontSize: 12)),
                ],
              ),
              Text(widget.courses['course'], maxLines: 1, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  CircleAvatar(radius: 3, backgroundColor: widget.courses['ongoing'] ? const Color(0xFF27E52D) : customGrey),
                  const SizedBox(width: 5),
                  Text(
                    widget.courses['ongoing'] ? 'ONGOING CLASS' : 'UPCOMING CLASS',
                    style: const TextStyle(color: customGrey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
class CardTile extends StatefulWidget {
  const CardTile({super.key, required this.rubrics, this.onTap});

  final Map rubrics;
  final void Function()? onTap;

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (b) => setState(() => _hover = b),
        child: Container(
          color: _hover ? Theme.of(context).hoverColor : white,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(widget.rubrics['icon'], color: widget.rubrics['color'], size: 32),
                    Text(widget.rubrics['text'], style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Container(height: 2.5, decoration: BoxDecoration(color: widget.rubrics['color'], borderRadius: BorderRadius.circular(15))),
            ],
          ),
        ),
      ),
    );
  }
}

//
class DetailCard extends StatefulWidget {
  const DetailCard({super.key, required this.details, required this.index});

  final Map details;
  final int index;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(color: widget.details['color'], borderRadius: BorderRadius.circular(5)),
                  child: Text(widget.details['title'], style: const TextStyle(color: white, fontSize: 10)),
                ),
                PopupMenuButton(
                  surfaceTintColor: transparent,
                  itemBuilder: (_) => [
                    PopupMenuItem(child: Text('Menu ${widget.index}')),
                  ],
                  child: const Icon(Icons.more_vert, size: 17),
                ),
              ],
            ),
            Text(widget.details['text'], maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, height: 1)),
            Text('${widget.index} day(s) ago', style: const TextStyle(color: customGrey, fontSize: 10))
          ],
        ),
      ),
    );
  }
}
