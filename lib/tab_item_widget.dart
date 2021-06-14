import 'package:flutter/material.dart';

class TabItemWidget extends StatefulWidget {
  final TextEditingController textEditingController;

  const TabItemWidget({Key? key, required this.textEditingController}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabItemWidgetState();
  }
}

class _TabItemWidgetState extends State<TabItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.all(16),
      child: Center(
        child: TextField(
          controller: widget.textEditingController,
        ),
      ),
    );
  }
}