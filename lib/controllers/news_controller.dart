import 'package:get/get.dart';
import 'package:rest_api_using_getx/models/article.dart';
import 'package:rest_api_using_getx/service/news_service.dart';

class NewsController extends GetxController {

  var articles = < Articles > [].obs;
  var isLoading = true.obs;
  
  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var articlesTemp = await NewsWebService.fetchNews();
      if (articlesTemp != null) {
        articles(articlesTemp);
      }

    } finally {
      isLoading(false);
    }
  }
}