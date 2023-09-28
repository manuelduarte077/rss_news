import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

class XMLHandler extends ChangeNotifier {
  late List<String> xml_urls = ['http://rss.cnn.com/rss/cnn_topstories.rss'];
  late List<Map<String, String>> feedItems = [];
  get getXMLURLs => xml_urls;

  Future<void> getXmlFromUrl(String url) async {
    // Create a new HttpClient object.
    //var httpClient = new HttpClient();

    // Make a GET request to the URL.
    var request = await http.get(Uri.parse(xml_urls[0]));

    // Check if the request was successful.
    if (request.statusCode == 200) {
      // Get the response body as a string.
      var responseBody = request.body;
      var document = XmlDocument.parse(responseBody);
      var items = document.findAllElements('item');
      // Parse the response body into an XmlDocument object.
      var data = XmlDocument.parse(responseBody);

      List<Map<String, String>> itemsList = [];
      for (var item in items) {
        var title = item.findElements('title').single.innerText;
        var link = item.findElements('link').single.innerText;

        itemsList.add({
          'title': title,
          'link': link,
        });
      }
      feedItems = itemsList;
    } else {
      // Throw an exception if the request was not successful.
      throw Exception('Request failed with status code ${request.statusCode}');
    }
  }
}
