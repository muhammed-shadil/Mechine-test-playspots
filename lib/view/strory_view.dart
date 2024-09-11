import 'dart:async';

import 'package:flutter/material.dart';

class StroryView extends StatefulWidget {
  const StroryView(
      {super.key,
      required this.story,
      required this.name,
      required this.profile});
  final String story;
  final String name;
  final String profile;

  @override
  State<StroryView> createState() => _StroryViewState();
}

class _StroryViewState extends State<StroryView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(widget.profile),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.name),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          widget.story,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
