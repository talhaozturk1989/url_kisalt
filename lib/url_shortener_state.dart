// ignore_for_file: avoid_print, unnecessary_string_interpolations, unused_element, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_kisalt/url_shortener_response_model.dart';

class UrlShortenerState extends ChangeNotifier {
  final urlController = TextEditingController();
  final List listem = [];

  String shortUrlMessage = "Give some long url to convert";

  handleGetLinkButton() async {
    final longUrl = urlController.text;

    final String shortUrl = await getShortLink(longUrl);

    shortUrlMessage = "$shortUrl";

    notifyListeners();
  }
   List get basketItems {
    return listem;
  }

  void ekle(String text) {
    listem.add(text);

    notifyListeners();
  }


   void sil(String text) {
    listem.remove(text);

    notifyListeners();
  }

  Future<String> getShortLink(String longUrl) async {
    final result = await http.post(
        Uri.parse("https://cleanuri.com/api/v1/shorten"),
        body: {"url": longUrl});

    if (result.statusCode == 200) {
      print("Succesfully Completed");

      final response = urlShortnerResponseFromJson(result.body);

      return response.resultUrl;
    } else {
      print("Error in Api");
      print(result.body);
      return "There is some in shortening the url";
    }
  }
}
