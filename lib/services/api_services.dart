import 'package:http/http.dart' as http;

class ApiServices {
  final String popularbaseURL =
      "https://movies-api.nomadcoders.workers.dev/popular";
  final String nowplayingURL =
      "https://movies-api.nomadcoders.workers.dev/now-playing";
  final String comingsoonURL =
      "https://movies-api.nomadcoders.workers.dev/coming-soon";
  final String detailmoveieURL =
      "https://movies-api.nomadcoders.workers.dev/movie?id=1";

  void getMoveis() async {
    final url = Uri.parse(nowplayingURL);
    final response = await http.get(
      url,
    ); // await can only be used in the async function
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
