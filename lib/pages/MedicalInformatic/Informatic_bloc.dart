import 'dart:async';
import 'package:flutter/material.dart';
import 'Informatic.dart';

class InformaticBloc {
  final List<informatic> _informatic_list = [
    informatic(
        'الصداع', 'assets/images/informatic1.jpg', 'توجد 8 انواع ....شسيشسي'),
    informatic(' علاج الحروق', 'assets/images/informatic2.jpg',
        'توجد7 انواع ....شسيشسي'),
    informatic('وجبة الإفطار', 'assets/images/informatic3.jpg',
        'توجد 8 انواع ....شسيشسي'),
    informatic('ابدأ يومك بنشاط', 'assets/images/informatic4.jpg',
        'توجد 8 انواع ....شسيشسي'),
  ];

//1- Stream Controllers
  final _informaticListStreamController = StreamController<List<informatic>>();

//2- Stream and Sink => getters
  Stream<List<informatic>> get informaticListStream =>
      _informaticListStreamController.stream;

  StreamSink<List<informatic>> get informaticListSkin =>
      _informaticListStreamController.sink;
//3- Constractor => add data and listen to changes
  InformaticBloc() {
    _informaticListStreamController.add(_informatic_list);
  }

  //4- dispose
  void dispose() {
    _informaticListStreamController.close();
  }
}
