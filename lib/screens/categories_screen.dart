// This is the categories screen of the app. It's used to show the categories of news articles such as 
//business, entertainment, health, science, sports, technology, etc.
import 'package:flutter/material.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/article_list.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<String> categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
  String selectedCategory = 'Business';

  late Future<List<Article>> _articles;

  @override
  void initState() {
    super.initState();
    _articles = NewsService().fetchArticlesByCategory(selectedCategory);
  }

  // Builds the categories screen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedCategory,
            items: categories.map((category) {
              return DropdownMenuItem(value: category, child: Text(category));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
                _articles = NewsService().fetchArticlesByCategory(selectedCategory);
              });
            },
          ),
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: _articles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading articles'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ArticleList(articles: snapshot.data!),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
