class Endpoints {
  Endpoints._();

  // base url
  static const String baseAddress =
      "https://654ca2f077200d6ba859225c.mockapi.io";
  static const String baseUrl = "http://jsonplaceholder.typicode.com";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = "$baseUrl/posts";

  //video
  static const String api_video = "$baseAddress/api_video";
}
