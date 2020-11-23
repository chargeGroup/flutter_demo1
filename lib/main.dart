import 'package:flutter/material.dart';
import 'package:flutter_demo1/CustomScreen.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;
  List<Widget> _children = [
    CustomScreen('好友',content:'好友页面的内容'),
    CustomScreen('发现',content:'发现页面的内容'),
    CustomScreen('管理',content:'管理页面的内容'),
    CustomScreen('我的',content:'我的页面的内容'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTaped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red[400],
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/invite_normal.png', width: 24, height: 24,),
            activeIcon: Image.asset('assets/images/invite_selected.png', width: 24, height: 24,),
            label: '好友',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/discovery_normal.png', width: 24, height: 24,),
            activeIcon: Image.asset('assets/images/discovery_selected.png', width: 24, height: 24,),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/manager_normal.png', width: 24, height: 24,),
            activeIcon: Image.asset('assets/images/manager_selected.png', width: 24, height: 24,),
            label: '管理',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/mine_normal.png', width: 24, height: 24,),
            activeIcon: Image.asset('assets/images/mine_selected.png', width: 24, height: 24,),
            label: '我的',
          ),
        ],
      ),
    );
  }

  void onTabTaped(int selectIndex) {
    setState(() {
      _currentIndex = selectIndex;
    });
  }
}
