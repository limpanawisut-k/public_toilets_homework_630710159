// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:public_toilets/models/toilet.dart';
import 'package:public_toilets/repositories/toilet_repository.dart';
import 'package:public_toilets/screens/home/toilet_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toiletNameController = TextEditingController();
  final _toiletPointController = TextEditingController();
  final _toiletDistanceController = TextEditingController();


  @override
  void initState() {
    super.initState();
    var data = ToiletRepository.readJsonData('assets/data/toilets.json');
    data.then(getResult);
  }

  getResult(String result) {
    debugPrint(result);
    List list = jsonDecode(result);
    List<Toilet> toiletList = list.map((item) {
      return Toilet.fromJson(item);
    }).toList();

    setState(() {
      ToiletRepository.toilets = toiletList;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Public Toilets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ToiletRepository.toilets!.length,
              itemBuilder: (ctx, i) {
                Toilet toilet = ToiletRepository.toilets![i];

                return ToiletListItem(
                  toilet: toilet,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _toiletNameController,
                  decoration: InputDecoration(
                    hintText: 'ชื่อห้องน้ำ',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _toiletPointController,
                        decoration: InputDecoration(
                          hintText: 'ให้คะแนน',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _toiletDistanceController,
                        decoration: InputDecoration(
                          hintText: 'ระยะทาง',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      var toiletName = _toiletNameController.text;
                      var toiletPoint = double.parse(_toiletPointController.text);
                      var toiletDistance = double.parse(_toiletDistanceController.text);
                      var toilet = Toilet(
                        name: toiletName,
                        point: toiletPoint, // todo: homework
                        distance: toiletDistance, // todo: homework
                      );

                      setState(() {
                        ToiletRepository.toilets!.add(toilet);
                      });

                      _toiletNameController.clear();
                      _toiletPointController.clear();
                      _toiletDistanceController.clear();
                    },
                    child: Text('ADD'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
