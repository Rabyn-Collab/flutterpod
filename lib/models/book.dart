


class Book{

 final String title;
 final String detail;
 final String rating;
 final String genre;
 final String imageUrl;

 Book({
   required this.imageUrl,
   required this.title,
   required this.detail,
   required this.genre,
   required this.rating
});

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
        imageUrl: json['imageUrl'],
        title: json['title'],
        detail: json['detail'],
        genre: json['genre'],
        rating: json['rating']
    );
  }

}

List<Book> books = [
  Book(
      imageUrl: 'assets/images/book.jpg',
      title: 'To Kill a Mockingbird',
      detail: 'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools. To Kill a Mockingbird has become a classic of modern American literature, winning the Pulitzer Prize.',
      genre: 'mystery',
      rating: '⭐⭐⭐⭐⭐'
  ),
  Book(
      imageUrl: 'assets/images/mocking.jpg',
      title: 'Mockingbird Chapter 3',
      detail: 'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools. To Kill a Mockingbird has become a classic of modern American literature, winning the Pulitzer Prize.',
      genre: 'horror',
      rating: '⭐⭐⭐⭐'
  ),
  Book(
      imageUrl: 'assets/images/mocking.jpg',
      title: 'Mockingbird Chapter 3',
      detail: 'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful. In the United States, it is widely read in high schools and middle schools. To Kill a Mockingbird has become a classic of modern American literature, winning the Pulitzer Prize.',
      genre: 'adventure',
      rating: '⭐⭐⭐⭐⭐'
  ),

];
