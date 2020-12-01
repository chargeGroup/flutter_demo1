import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo1/screens/find/company.dart';
import 'package:http/http.dart' as http;

class FindListProvider with ChangeNotifier {
  int _currentPage = 1;
  int _showValue = 0;
  List<Company> _companies = [];
  List<Company> get companyList => _companies; // 获取list数据
  int get currentPage => _currentPage; // 获取当前的页数
  int get showValue => _showValue; // 获取当前显示的状态
  set companyList(List<Company> companyList) {
    _companies = companyList;
    notifyListeners();
  }

  // 网络加载
  int _type = 1;
  var url = 'http://m.app.haosou.com/index/getData?';
  refreshData() async{
    var httpURL = url + 'type=$_type&page=1';
    var response = await http.get(httpURL);
    if(response.statusCode == 200) {
      var data = response.body;
      var map = jsonDecode(data);
      _companies = Company.fromMapData(map);
      _currentPage = 2;
      _showValue = 1;
      notifyListeners();
      return true;
    }
    return false;
  }

  loadMoreData() async{
    var httpURL = url + 'type=$_type&page=$_currentPage';
    var response = await http.get(httpURL);
    if(response.statusCode == 200) {
      var data = response.body;
      var map = jsonDecode(data);
      _companies.addAll(Company.fromMapData(map));
      _currentPage ++;
      notifyListeners();
      return true;
    }
    return false;
  }

}