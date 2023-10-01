import 'package:flutter/services.dart';
import 'package:public_toilets/models/toilet.dart';

class ToiletRepository {
  //static List<Toilet> toilets = [
  //Toilet(name: 'ห้องน้ำ 1', point: 4.1, distance: 150.0),
  //Toilet(name: 'ห้องน้ำ 2', point: 4.5, distance: 50.0),
  //Toilet(name: 'ห้องน้ำ 3', point: 3.7, distance: 350.0),
  //Toilet(name: 'ห้องน้ำ 4', point: 4.0, distance: 220.0),
  //Toilet(name: 'ห้องน้ำ 5', point: 4.8, distance: 550.0),
  //Toilet(name: 'ห้องน้ำ 6', point: 2.5, distance: 10.0),
  //];

  static List<Toilet>? toilets = [];
  static Future<String> readJsonData(String path) async {
    // read json file
    return await rootBundle.loadString(path);
  }
}