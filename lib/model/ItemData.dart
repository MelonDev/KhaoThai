import 'package:new_khao_thai/model/DessertModel.dart';
import 'package:new_khao_thai/model/DrinkModel.dart';
import 'package:new_khao_thai/model/HealthModel.dart';
import 'package:new_khao_thai/model/RiceModel.dart';

class ItemData {
  final String thaiName;
  final String englishName;
  final String subThaiName;
  final String subEnglishName;

  final String image;
  final List<String> gallery;

  final DetailModel detailModel;

  ItemData(this.thaiName, this.englishName,
      {this.image,
      this.subEnglishName,
      this.subThaiName,
      this.detailModel,
      this.gallery});
}
