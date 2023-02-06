import 'movie.dart';



class MovieState{

  final bool isLoad;
  final bool isError;
  final String errorMessage;
  final List<Movie> movies;

  MovieState({
    required this.isLoad,
    required this.isError,
    required this.errorMessage,
    required this.movies
});

  MovieState copyWith ({
    bool? isLoad,
  bool? isError,
  String? errorMessage,
  List<Movie>? movies
  }){
    return MovieState(
        isLoad: isLoad ?? this.isLoad,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        movies: movies ?? this.movies
    );
  }

}
