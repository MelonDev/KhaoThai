import 'package:flutter/cupertino.dart';
import 'package:new_khao_thai/model/DessertModel.dart';
import 'package:new_khao_thai/model/ItemData.dart';
import 'package:new_khao_thai/model/WordItem.dart';

List<ItemData> tabFourList() {
  return [
    ItemData("ลูกประคบสมุนไพร", "Thai herbal ball",
        image:
            "images/KhaoThai/HerbalBall/4620693218536036483.1f786335035392d1be8570613efe581d.19080407.jpg",
        subEnglishName: "Hot compressed massage ball",
        detailModel: DetailModel(
          vocabulary: [
            WordItem("สมุนไพร", "Herb"),
            WordItem("มีสมุนไพร", "Herbal"),
            WordItem("นวด กดจุด", "Compress"),
            WordItem("นวด", "Massage"),
          ],
          ingredients: [
            WordItem("ข้าวอินทรีย์", "Organic rice"),
            WordItem("สมุนไพรไทย", "Thai herbs"),
            WordItem("ขิง", "Ginger"),
            WordItem("ไพล", "Bengal root"),
            WordItem("ใบมะขาม", "Tamarind leaves"),
            WordItem("ตระไคร้", "Lemon grass"),
            WordItem("ผิวมะกรูด", "Kaffir lime skin"),
            WordItem("ใบกระเพราแห้ง", "Dried basil leaves"),
            WordItem("ผกากรอง", "Sweet sage"),
            WordItem("ผิวส้ม", "Orange peel"),
          ],
          properties: [
            WordItem("ช่วยผ่อนคลาย", "It induces deep relaxation"),
            WordItem("ลดอาการเหนื่อยหล้า", "It relieves stress and tiredness"),
            WordItem("ช่วยสมดุลจิตใจและร่างกาย", "It boosts emotional and physical well-being"),
            WordItem("ลดอาการเจ็บและเส้นยึด", "It relieves pains and stiffness"),
            WordItem("บรรเทาอาการปวดหลังและไมเกรน", "It relieves migraine and back pain"),
          ],
          usage: [
            WordItem("แช่น้ำประมาณ 3 นาที", "Soak the herbal ball in the water for 3 minutes"),
            WordItem("อุ่นในไมโครเวฟประมาณ 1 ถึง 2 นาที", "Warm it in a microwave for 1 to 2 minutes"),
            WordItem("แนะนำให้นึ่งเพื่อประโยชน์สูงสุด", "Steaming method is recommended for maximum benefit"),
          ],
          storage: [
            WordItem("สามารถใช้ได้ถึง 5 ครั้ง","Herbal massage ball can be used up to five times"),
            WordItem("ตากลมให้แห้ง และเก็บในตู้เย็น","Let it air dry after each use and store it in a refrigerator"),
          ]
        ))
  ];
}
