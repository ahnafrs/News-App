import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/const.dart';
import 'package:newsapp/model/news_model.dart';

class CustomHttp {
  Future<List<Articles>> fetchAllnewsData(
      {required String pageNo, required String sortBy}) async {
    List<Articles> allnewsData = [];
    Articles articles;

    var response = await http.get(Uri.parse(
        '${baseUrl}q=bitcoin&page=$pageNo&pageSize=$sortBy&apiKey=$token'));
    var data = jsonDecode(response.body);
    for (var i in data['articles']) {
      articles = Articles.fromJson(i);
      allnewsData.add(articles);
    }
    return allnewsData;
  }
}
