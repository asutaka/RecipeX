class Endpoints {
  Endpoints._();

  // base url
  static const String baseAddress =
      "https://654ca2f077200d6ba859225c.mockapi.io";
  static const String baseUrl = "http://jsonplaceholder.typicode.com";
  static const String baseAddress2 =
      "https://655f7611879575426b4563ca.mockapi.io";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = "$baseUrl/posts";

  //video
  static const String api_video = "$baseAddress/api_video";
  //resource
  static const String api_resource = "$baseAddress/api_resource";
  //new cook
  static const String api_newcook = "$baseAddress/api_newcook";
  //fire cook
  static const String api_firecook = "$baseAddress/api_firecook";
}
