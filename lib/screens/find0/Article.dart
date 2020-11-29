import 'dart:convert';

class Article {
  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String hot;
  final String count;
  final String inc;

  Article({
    this.count,
    this.employee,
    this.hot,
    this.inc,
    this.location,
    this.logo,
    this.name,
    this.size,
    this.type,
  });

  static List<Article> resolveDataFromJsonString(String json) {
    List<Article> listModel = new List<Article>();
    List list = jsonDecode(json)['list'];

    list.forEach((element) {
      var model = Article(
        count: element['count'],
        employee: element['employee'],
        hot: element['hot'],
        inc: element['inc'],
        location: element['location'],
        logo: element['logo'],
        name: element['name'],
        size: element['size'],
        type: element['type'],
      );
      listModel.add(model);
    });

    return listModel;
  }
}
