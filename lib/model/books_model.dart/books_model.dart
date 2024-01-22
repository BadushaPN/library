import 'dart:math';

class Book {
  final String title;
  final String author;
  final String genre;
  final int publishYear;
  final double price;
  final String coverUrl;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.publishYear,
    required this.price,
    required this.coverUrl,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      genre: map['genre'] ?? '',
      publishYear: map['publishYear'] ?? 0,
      price: map['price'] ?? 0.0,
      coverUrl: map['coverUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'genre': genre,
      'publishYear': publishYear,
      'price': price,
      'coverUrl': coverUrl,
    };
  }
}

List<Book> generateDemoBooks() {
  final Random random = Random();
  final List<String> titles = ['Title A', 'Title B', 'Title C'];
  final List<String> authors = ['Author X', 'Author Y', 'Author Z'];
  final List<String> genres = ['Fiction', 'Non-fiction', 'Sci-Fi', 'Mystery'];
  final List<String> coverUrls = [
    'https://i.imgur.com/1.jpg',
    'https://i.imgur.com/2.jpg',
    'https://i.imgur.com/3.jpg',
    'https://i.imgur.com/4.jpg',
    'https://i.imgur.com/5.jpg',
    // Add more URLs as needed
  ];
  final List<Book> books = [];

  for (int i = 0; i < 100; i++) {
    final Book book = Book(
      title: titles[random.nextInt(titles.length)],
      author: authors[random.nextInt(authors.length)],
      genre: genres[random.nextInt(genres.length)],
      publishYear: 2000 + random.nextInt(20),
      price: 10.0 + random.nextDouble() * 20.0,
      coverUrl: coverUrls[random.nextInt(coverUrls.length)],
    );
    books.add(book);
  }

  return books;
}
