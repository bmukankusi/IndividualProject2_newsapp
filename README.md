# newsapp

A news app built with flutter and newsapi.org, it allows you to search for news articles around the world.

## Features

- Read top headlines from around the world.
- Search for news articles by keyword.
- Filter news articles by category.
- Read full article in browser by clicking on the article.

## API used and why

- [NewsAPI](https://newsapi.org/) - I used this API because it provides a wide range of news sources and categories, and it's free to use.

## State Management

- [Provider](https://pub.dev/packages/provider) - I used this package because it's a simple and effective way to manage the state of the app.
- It help in managing the state of the app and it's easy to implement.

## Screens and their functionalities

- Splash Screen - It's the first screen that appears when the app is launched. It's used to show the logo of the app and it's a good way to make the app look more professional.
- Home Screen - It's the main screen of the app. It's used to show the top headlines from around the world.
- Categories Screen - It's a screen that shows all the categories of news articles. It's used to show the categories of news articles such as business, entertainment, health, science, sports, technology, etc.
- Search Screen - It's a screen that shows the search results for the news articles. It's used to search for news articles by keyword.

## Challenges I faced while building the app and how I solved them

- I faced some issues while fetching the news articles from the API and I solved them by throwing exceptions to handle the errors.
- The urls of the news articles were not loading in the webview and I solved them by using the Uri.parse method to parse the urls.
- At first, I couldn't load articles urls in emulator which frustrated me for a while. But I made research and found out that the problem was in the android manifest file. I added the internet permission in the manifest file and it solved the problem.

## How to run the app

- Clone the repository.
- Get an API key from [NewsAPI](https://newsapi.org/) and replace the myApiKey in the news_service.dart file with your API key.
- Run the app using your emulator or your phone.

## Screenshots

![newsapp_splashscreen](https://github.com/user-attachments/assets/398aeade-d37a-47f7-b993-6d6e83451c8e)

![newsapp_homescreen](https://github.com/user-attachments/assets/756d3df6-f2b6-4f44-9af8-9f4669e716ee)

![newsapp_searchscreen](https://github.com/user-attachments/assets/c3a5c1b4-fb20-4cd7-a815-766702056167)




