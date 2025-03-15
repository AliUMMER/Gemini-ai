import 'dart:convert';

import 'package:http/http.dart';

import '../../model_class/gemini_model.dart';
import 'api_client.dart';

class GemaniApi {
  ApiClient apiClient = ApiClient();

  Future<GeminiModel> getTranslate(String text) async {
    String trendingpath = 'https://gemini-pro-ai.p.rapidapi.com';
    var body = {
      "contents": [
        {"prompt": text}
      ]
    };
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return GeminiModel.fromJson(jsonDecode(response.body));
  }
}
