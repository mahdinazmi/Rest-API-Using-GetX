import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_using_getx/controllers/news_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({ Key? key }) : super(key: key);
  
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff535FF7),
        title: const Text('News'),
      ),
      body: Obx(
        () => _newsController.isLoading.value ? 
        const Center(
          child:  CircularProgressIndicator(),
        ) : ListView.builder(
          itemCount: _newsController.articles.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color.fromRGBO(205, 213, 223, 1),width: 1)
              ),
              child: Center(
                child: Text(
                  _newsController.articles[index].title!,
                  style: const TextStyle(
                    color: Color.fromRGBO(76, 85, 102, 1),
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            );
          }
        )
      ),
    );
  }
}