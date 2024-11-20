// Search screen of the app where you can search for news articles by keyword.
import 'package:flutter/material.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/widgets/article_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<List<Article>>? _searchResults;

  void _searchNews() {
    setState(() {
      _searchResults = NewsService().searchArticles(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search News')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (_) => _searchNews(),
            ),
          ),
          Expanded(
            child: _searchResults == null
                ? const Center(child: Text('Enter a keyword to search'))
                : FutureBuilder<List<Article>>(
                    future: _searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text('Error loading results'));
                      } else {
                        return ArticleList(articles: snapshot.data!);
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
