// This is the home screen of the app. It's used to show the top headlines from around the world.
import 'package:flutter/material.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/article_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Article>> _topHeadlines;

  @override
  void initState() {
    super.initState();
    _topHeadlines = NewsService().fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Headlines'),
        actions: [
          IconButton(
            icon: const Icon(Icons.category),
            onPressed: () => Navigator.pushNamed(context, '/categories'),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/search'),
          ),
        ],
      ),
      // Builds the home screen, fetches the top headlines and displays them in a list, 
      //and loads error message if the headlines are not fetched.
      body: FutureBuilder<List<Article>>(
        future: _topHeadlines,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading headlines'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ArticleList(articles: snapshot.data!),
            );
          }
        },
      ),
    );
  }
}
