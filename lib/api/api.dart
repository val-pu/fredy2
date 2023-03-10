const String apiUrl = "localhost:8080";

Uri Function(String, String, [Map<String, dynamic> queryParameters]) httpMethod = Uri.http;

const Map<String, String> requestHeader = {
  "content-type": "application/json",
  "accept": "application/json",
};