import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_textedit_tab/tab_item_widget.dart';

class InnerWidget extends StatefulWidget {
  final List<TextEditingController> textControllers;

  const InnerWidget({Key? key, required this.textControllers}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InnerWidgetState();
  }
}

class _InnerWidgetState extends State<InnerWidget> with TickerProviderStateMixin<InnerWidget> {
  late TabController _tabController;
  late int _tabLength;

  @override
  void initState() {
    _tabLength = 4;
    _tabController = TabController(length: _tabLength, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _createTaBarbChildren() {
    return [
      Tab(
        text: "Tab 1",
      ),
      Tab(
        text: "Tab 2",
      ),
      Tab(
        text: "Tab 3",
      ),
      Tab(
        text: "Tab 4",
      ),
    ];
  }

  List<Widget> _createTabBarViewChildren() {
    return [
      TabItemWidget(textEditingController: widget.textControllers[0]),
      TabItemWidget(textEditingController: widget.textControllers[1]),
      TabItemWidget(textEditingController: widget.textControllers[2]),
      TabItemWidget(textEditingController: widget.textControllers[3]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: _createTaBarbChildren(),
              labelColor: Colors.black87,
              indicatorColor: Colors.black87,
            ),
            Container(
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: _createTabBarViewChildren(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColoredTabBar extends Container implements PreferredSizeWidget {
  final TabBar tabBar;

  ColoredTabBar({
    required this.tabBar
  });

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: kToolbarHeight,
    child: Material(
      elevation: 4,
      color: Colors.yellow,
      child: tabBar,
    ),
  );
}