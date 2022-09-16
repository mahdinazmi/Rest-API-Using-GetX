import 'package:http/http.dart' as http;
import 'package:rest_api_using_getx/constants/constants.dart';
import 'package:rest_api_using_getx/models/article.dart';

class NewsWebService {

  static var client = http.Client();

  static Future<List<Articles>?> fetchNews() async {

    var response = await client.get(Uri.parse(Constants.TOPHEADLINES));

    if(response.statusCode == 200) {
      return articlesFromJson(response.body);
    } else {
      return null;
    }

  }
  
}