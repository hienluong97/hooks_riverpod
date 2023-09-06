import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../model/Photo.dart';
import 'package:http/http.dart' as http;

List<Photo> parsePhotos(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
  return photos;
}

const getPhotosUrl = 'https://jsonplaceholder.typicode.com/photos';

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get(Uri.parse(getPhotosUrl));

  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception(' Cant get photo');
  }
}
