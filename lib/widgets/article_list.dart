// This is the widget for the news articles list. It's used to display the news articles in a list.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:newsapp/services/news_service.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: article.imageUrl.isNotEmpty
                ? Image.network(article.imageUrl, width: 100, height: 200, fit: BoxFit.fill)
                : const Icon(Icons.image, size: 100),
            title: Text(
              article.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              article.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () {
              debugPrint('Opening URL: ${article.url}');
              _launchURL(context, article.url);
            },
          ),
        );
      },
    );
  }
// Launches the url in the webview.
  void _launchURL(BuildContext context, String url) async {
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No URL available for this article.')),
      );
      return;
    }

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open URL: $url')),
      );
    }
  }
}
