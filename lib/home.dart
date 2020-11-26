import 'package:flutter/material.dart';
import 'package:flutter_demo1/screens/find/FindScreen.dart';
import 'package:flutter_demo1/screens/manager/ManagerScreen.dart';
import 'package:flutter_demo1/screens/mine/MineScreen.dart';
import 'package:flutter_demo1/screens/trend/TrendScreen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TrendScreen(),
    FindScreen(),
    ManagerScreen(),
    MineScreen(),
  ];

  List<BottomNavigationBarItem> _itemList = [
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/invite_normal.png', width: 24, height: 24),
      activeIcon: Image.asset('assets/images/invite_selected.png', width: 24, height: 24),
      label: '好友',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/discovery_normal.png', width: 24, height: 24),
      activeIcon: Image.asset('assets/images/discovery_selected.png', width: 24, height: 24),
      label: '发现',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/manager_normal.png', width: 24, height: 24),
      activeIcon: Image.asset('assets/images/manager_selected.png', width: 24, height: 24),
      label: '管理',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('assets/images/mine_normal.png', width: 24, height: 24),
      activeIcon: Image.asset('assets/images/mine_selected.png', width: 24, height: 24),
      label: '我的',
    ),
  ];

  void onTabAction(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabAction,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        items: _itemList,
      ),
    );
  }
}