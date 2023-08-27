class APIUrl {
  static String baseUrl = "https://api.themoviedb.org/3/movie";

  static String apiKey = "b10b7754459ef9858d95e55c9341a44b";

  static String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMTBiNzc1NDQ1OWVmOTg1OGQ5NWU1NWM5MzQxYTQ0YiIsInN1YiI6IjYzZDBlY2Q0YTQxMGM4MTIzODVjODUzZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rgw93VbyYNH9kAKtejDRH_jYpRJJLfLKoFHT6n2H4ZY";

  // static int animationMovieId = 16;

  static String imgBaseUrl =
      "https://www.themoviedb.org/t/p/w220_and_h330_face";

  static String nowShows =
      "$baseUrl/now_playing?api_key=$apiKey&language=en-US&page=1";

  static String upcomingMovies =
      "$baseUrl/upcoming?api_key=$apiKey&language=en-US&page=1";
}
