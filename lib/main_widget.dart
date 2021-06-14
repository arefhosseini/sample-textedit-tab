import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_textedit_tab/inner_widget.dart';

class MainWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MainWidgetState();
  }
}

class _MainWidgetState extends State<MainWidget> {
  late List<TextEditingController> _innerTextControllers;
  late TextEditingController _mainTextController;
  late ScrollController _scrollController;

  @override
  void initState() {
    _innerTextControllers = [];
    _mainTextController = TextEditingController(text: "main text");

    for (int counter  = 0; counter < 4; counter ++) {
      TextEditingController controller = TextEditingController(text: "text ${counter + 1}");
      controller.addListener(() => _onChangedText(counter));
      _innerTextControllers.add(controller);
    }

    _scrollController = ScrollController(initialScrollOffset: 200);
    _scrollController.addListener(() {
      if (_scrollController.offset > 400) {
        print("POSITION 400");
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onChangedText(int index) {
    _mainTextController.text = _innerTextControllers[index].text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            controller: _scrollController,
            children: [
              Container(
                height: 200,
                color: Colors.teal,
              ),
              InnerWidget(textControllers: _innerTextControllers),
              Container(
                height: 800,
                color: Colors.deepPurple,
              ),
              TextField(
                controller: _mainTextController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}