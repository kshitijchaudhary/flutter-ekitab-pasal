import 'package:http/http.dart' as http;
class Repository{

    String _baseUrl = "https://ekitabpasal-api.chaudharykshitij.com.np/api";
    httpGet(String api) async{
      return await http.get(_baseUrl + "/" + api);
    }

  httpGetById(String api, categoryId) async {
    return await http.get(_baseUrl + "/" + api + "/" + categoryId.toString());
  }
  httpPost(String api, data) async {
    return await http.post(_baseUrl + "/" + api, body: data);
  }
}