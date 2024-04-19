import 'book_model.dart';

List<Book> _allBooks = [

  Book(
      name: "Super man",
      author: "Afia Atakora",
      coverImage: "assets/images/su.jpg",
      rating: 4.0),

  Book(
      name: "Recipie For a Per..",
      author: "Karma Brown",
      coverImage: "assets/images/ad6.jpg",
      rating: 4.0),
  Book(
      name: "The Glass Hotel",
      author: "Emily St. John Mandel",
      coverImage: "assets/images/ad7.jpg",
      rating: 4.0),

  Book(
      name: "Conjure Women",
      author: "Afia Atakora",
      coverImage: "assets/images/ad8.jpg",
      rating: 4.0),




];

List<Book> _recentBooks = [
  Book(
      name: "Daughter of Man",
      author: "Afia Atakora",
      coverImage: "assets/images/ad4.jpeg",
      rating: 4.0),
  Book(
      name: "The Hobbit",
      author: "J.R.R.TOLKIEN",
      coverImage: "assets/images/hobbit.jpg",
      rating: 4.0),
  Book(
      name: "Sherlock Holmes",
      author: "Sir Arthur conan Doyale",
      coverImage: "assets/images/sherlock.jpg",
      rating: 4.0),
  Book(
      name: "Sherlock Holmes",
      author: "Sir Arthur conan Doyale",
      coverImage: "assets/images/sherlock2.jpg",
      rating: 4.0),
];

List<Book> _upcomingBooks = [

  Book(
      name: "Change your thinking",
      author: "Brian Tracy",
      coverImage: "assets/images/br.jpg",
      rating: 4.0),



  Book(
      name: "Felix Ever After",
      author: "Robert Kiyosaki",
      coverImage: "assets/images/rich.jpg",
      rating: 4.0),
  Book(
      name: "From The Ashes",
      author: "Jesse Thistle",
      coverImage: "assets/images/gul.jpg",
      rating: 4.0),
  Book(
      name: "Treasure Islands",
      author: "Robert Louis Stevenson",
      coverImage: "assets/images/tre.jpg",
      rating: 4.0),

  Book(
      name: "City of Girls",
      author: "Elizabeth Gilbert",
      coverImage: "assets/images/nov.jpg",
      rating: 4.0),






];

List<Book> get allBooks {
  return [..._allBooks];
}

List<Book> get recentBooks {
  return [..._recentBooks];
}

List<Book> get upcomingBooks {
  return [..._upcomingBooks];
}
