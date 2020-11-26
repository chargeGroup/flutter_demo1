import 'package:flutter/material.dart';
import 'package:flutter_demo1/screens/find/Article.dart';

class ArticleItem extends StatelessWidget {
  final Article model;

  ArticleItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(model.logo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 100,
                      child: Text(
                        model.location,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey
                        )
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('|${model.type}', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Text('|${model.size}', style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Text('|${model.employee}', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[300]),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '热招：${model.hot} 等${model.count}个职位', 
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.grey[500],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}