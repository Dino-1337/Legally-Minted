import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../artical_news.dart';

class NewsPage extends StatefulWidget {
 const NewsPage({super.key});

 @override
 State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
 late ScrollController controller;
 List<dynamic> news = []; // Define the news list
 bool isLoading = false; // Define the isLoading boolean

 @override
 void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
    // Assuming you have a method to fetch news, call it here
    // For example: fetchNews();
 }

 @override
 void dispose() {
    controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
 }

 void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      // Implement your logic to load more news here
      // For example: loadMoreNews();
    }
 }

 @override
 Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        if (index >= news.length) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                 onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (BuildContext context) =>
                            ArticalNews(
                          newsUrl: news[index]['url'] as String,
                        ),
                      ),
                    );
                 },
                 child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            if (news[index]['urlToImage'] == null)
                              Container()
                            else
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                 placeholder: (BuildContext context, String url) => Container(),
                                 errorWidget: (BuildContext context, String url, error) => const SizedBox(),
                                 imageUrl: news[index]['urlToImage'] as String,
                                ),
                              ),
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: Card(
                                elevation: 0,
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                child: Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                 child: Text(
                                    "${news[index]['source']['name']}",
                                    style: Theme.of(context).textTheme.subtitle2,
                                 ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Text(
                          "${news[index]['title']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                 ),
                ),
              ),
            ),
            if (index == news.length - 1 && isLoading)
              const Center(
                child: CircularProgressIndicator(
                 backgroundColor: Colors.yellow,
                ),
              )
            else
              const SizedBox(),
          ],
        );
      },
      itemCount: news.length + 1, // +1 for the loading indicator
    );
 }
}
