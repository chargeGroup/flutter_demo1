import 'dart:convert';

class Article {
  final String articleTitle;
  final String articleSubtitle;
  final String articlePic;
  final String userName;
  final String count;

  Article({
    this.articlePic,
    this.articleSubtitle,
    this.articleTitle,
    this.count,
    this.userName,
  });

  static List<Article> resolveDataFromJsonString(String json) {
    List<Article> listModel = new List<Article>();
    List list = jsonDecode(json)['list'];

    list.forEach((element) {
      var model = Article(
        articlePic: element['articlePic'],
        articleSubtitle: element['articleSubtitle'],
        articleTitle: element['articleTitle'],
        count: element['count'],
        userName: element['userName'],
      );
      listModel.add(model);
    });

    return listModel;
  }
}