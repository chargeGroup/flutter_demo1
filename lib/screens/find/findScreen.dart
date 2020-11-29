import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo1/screens/find/Company.dart';
import 'package:flutter_demo1/screens/find/CompanyItem.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;


class FindScreen extends StatefulWidget {
  FindScreen({Key key}) : super(key: key);

  @override
  _FindScreenState createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  int _currentPage = 1;
  List<Company> _companies = [];
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getCompanyList(_currentPage);
  }

  getCompanyList(page) async{
    String url = 'http://m.app.haosou.com/index/getData?type=1&page=$page';
    var response = await http.get(url);
    var data = response.body;
    var map = jsonDecode(data);
    setState(() {
      if (page == 1) {
        _companies = Company.fromMapData(map);
      } else {
        _companies.addAll(Company.fromMapData(map));
      }
    });
  }

  _buildContent() {
    if(_companies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: ClassicHeader(
        refreshingText: '正在加载中...', 
        idleText: '下拉刷新',
        completeText:'加载完成',
        failedText: '数据刷新异常',
        releaseText:'松开刷新',
      ),
      footer: ClassicFooter(
        idleText:'加载更多数据',
        loadingText:'玩命加载中...',
        noDataText:'没有更多数据'
      ),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      controller: _refreshController,
      child: ListView.builder(
        itemCount: _companies.length,
        itemBuilder: (context, index){
          Company company = _companies[index];
          return CompanyItem(company);
        }
      ),
    );
  }

  Future _onRefresh() async{
    Future<Null> future = new Future(() => null);
    await future.then((_){
      getCompanyList(1);
    }).then((_){
      setState(() {
        _currentPage = 1;
      });
      _refreshController.refreshCompleted();
    }).catchError((_){
      print("catchError");
    });
  }

  Future _onLoading() async{
    Future<Null> future = new Future(() => null);
    await future.then((_){
      getCompanyList(_currentPage + 1);
    }).then((_){
      setState(() {
        _currentPage = _currentPage + 1;
      });
      _refreshController.loadComplete();
    }).catchError((_){
      print("catchError");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('发现'), 
      ),
      body: _buildContent()
    );
  }
}