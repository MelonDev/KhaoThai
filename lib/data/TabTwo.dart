import 'package:new_khao_thai/model/DessertModel.dart';
import 'package:new_khao_thai/model/ItemData.dart';
import 'package:new_khao_thai/model/WordItem.dart';

List<ItemData> tabTwoList() {
  return [
    ItemData(
      "ข้าวแต๋น",
      "Rice cracker",
      image:
          "images/KhaoThai/RiceCracker/4620693218534575887.c8021b68cf41c2a68c5cb40b68f8c679.19061312.jpg",
      subEnglishName: "Crispy rice cake",
      gallery: [
        "images/KhaoThai/RiceCracker/4620693218534575887.0f1e88c290c19c494ed9b806d6ded004.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.0f3cb56ee16b9ee63ab961c1c5e11ac7.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.3d1adcc9fc4e8991f62319f48b07d6b5.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.6d387dd82426e633796d6b2536991396.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.7db1a3e4a584e8130b37aaf4c75c2ad5.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.699e20ec443cc7accec502cf6f61c3cb.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.4068aff98f2555bdef173b7da7a49a30.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.13333f43dcc8385310bf76e1122db061.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.38172a37ac05227cd75a97998f9f8bc6.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.458034980d036fcf765d2681bed0ee12.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.16930462029ff1325bf7ed4055273196.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.a89254900a38e94a01b671d889801ead.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.daa336388aaa3ccce225420840e8b2ab.19061312.jpg",
        "images/KhaoThai/RiceCracker/4620693218534575887.f9521477eb26a350d70f3732604a27fb.19061312.jpg",
      ],
      detailModel: DetailModel(ingredients: [
        WordItem("ข้าวเหนียว", "Sticky rice"),
        WordItem("น้ำแตงโม", "Water melon juice"),
        WordItem("น้ำตาลทรายแดง", "Brown sugar"),
        WordItem("น้ำอ้อย", "Sugarcane"),
        WordItem("เกลือ", "Salt"),
        WordItem("งาขาว", "White sesame"),
        WordItem("น้ำตาลปึก", "Palm sugar"),
      ]),
    ),
    ItemData(
        "ข้าวต้มมัด", "Steamed Thai banana with sticky rice in banana leaf",
        image:
            "images/KhaoThai/StickyRice/4620693218534908109.88321625995846291ea89564e35573a3.19062511.jpg",
        gallery: [
          "images/KhaoThai/StickyRice/4620693218534908109.64ed40c2ddfe8ecf50a6eb6af0f8fcb8.19062511.jpg",
          "images/KhaoThai/StickyRice/4620693218534908109.430e6230469ecb68b92ca456240b38d5.19062511.jpg",
          "images/KhaoThai/StickyRice/4620693218534908109.70483adfd99195fc6695572f29113f84.19062511.jpg",
          "images/KhaoThai/StickyRice/4620693218534908109.a7f636e6cecae48e671cec801e5b8339.19062511.jpg",
          "images/KhaoThai/StickyRice/4620693218534908109.ecf665d4fece74b6c2166aea4d0fc254.19062511.jpg",
        ],
        detailModel: DetailModel(ingredients: [
          WordItem("กล้วย", "Banana"),
          WordItem("ข้าวเหนียว", "Sticky rice"),
          WordItem("ต้ม", "Boil"),
          WordItem("ใบตอง", "Banana leaf"),
          WordItem("กะทิ", "Coconut milk"),
        ], vocabulary: [
          WordItem("อย่ากินใบตอง!", "Don’t eat the banana leaf!"),
        ])),
    ItemData(
      "ข้าวมันปิ้ง",
      "Grilled sticky rice in banana leaf",
      image:
          "images/KhaoThai/GrilledStickyBananaLeaf/4620693218536221045.f97b42f1e55ec40667a4afbe07941d35.19081010.jpg",
      gallery: [
        "images/KhaoThai/GrilledStickyBananaLeaf/4620693218536221045.51e6cf7c4cd84586da723d89cc374fb0.19081010.jpg",
        "images/KhaoThai/GrilledStickyBananaLeaf/4620693218536221045.8481f32c6e4e8a02bff732f68d284c54.19081010.jpg",
        "images/KhaoThai/GrilledStickyBananaLeaf/4620693218536221045.bd3c8f1ec8502a8f757237f4e1f3d5b6.19081010.jpg"
      ]
    ),
    ItemData("ข้าวยำปักษ์ใต้", "Southern Thai rice salad",
        image:
            "images/KhaoThai/SouthernThaiRice/4620693218536026847.ce4e6700df961d049f6dab41918ff02c.19080402.jpg",
        subEnglishName: "Thai spicy rice salad",
        gallery: [
          "images/KhaoThai/SouthernThaiRice/4620693218536026847.4e88d7b843c8e76b6573c7b1058a73c7.19080402.jpg",
          "images/KhaoThai/SouthernThaiRice/4620693218536026847.7cc1a921234095013de5eaa79ad27974.19080402.jpg"
        ],
        detailModel: DetailModel(
          conversation: [
            WordItem("ส่วนประกอบมีอะไรบ้าง?", "What are the ingredients?"),
            WordItem("รสชาติเป็นอย่างไร?", "How does it taste?"),
            WordItem("รสชาติหวาน เปรี้ยว เผ็ดเล็กน้อย",
                "It tastes sweet and sour and a bit spicy")
          ],
          ingredients: [
            WordItem("ตะใคร้", "Lemon grass stalks"),
            WordItem("ข่า", "Galangal"),
            WordItem("น้ำตาลปี้บ", "Palm sugar"),
            WordItem("ต้นหอม", "Shallot"),
            WordItem("ใบมะกรูด", "Kaffir lime leaves"),
            WordItem("ถั่วฝักยาว", "Green been"),
            WordItem("ถั่วฝักยาว", "Thinly sliced crosswise"),
            WordItem("มะนาว", "Lime"),
            WordItem("ถั่วงอก", "Bean sprouts"),
            WordItem("มะม่วงขูดฝอย", "Sliced mangos"),
            WordItem("พริกขี้หนูสด", "Chilies"),
          ],
          benefits: [
            WordItem("อุดมด้วยสมุนไพรไทย", "It contains a lot of Thai herbs"),
            WordItem(
                "เหมาะสำหรับผู้ที่ต้องการควบคุมน้ำหนักและไม่ต้องการรับประทานเนื้อสัตว์",
                "It’s good for weight control and those hoping to cut back on meat intake"),
          ],
        )),
    ItemData("ข้าวควบ", "Thai rice chips",
        image:
            "images/KhaoThai/ThaiRiceChips/4620693218536026890.1b7a2c8b596236aac38a1fc1476ef31e.19080402.jpg",
        gallery: ["images/KhaoThai/ThaiRiceChips/4620693218536026890.4095d6802c15234558d01eb70cfe109a.19080402.jpg"],
        detailModel: DetailModel(ingredients: [
          WordItem("ข้าวเหนียว", "Sticky rice"),
          WordItem("กะทิ", "Coconut milk"),
          WordItem("ไข่ไก่", "Egg"),
          WordItem("น้ำมัน", "Oil"),
          WordItem("น้ำตาลปึก", "Palm sugar"),
        ])),
    ItemData("ข้าวเหนียวมูน", "Sticky rice in coconut milk",
        image:
            "images/KhaoThai/StickyRiceCoconutMilk/4620693218536036542.364ed1ef5b1565fdf0d193df64d1dc43.19080407.jpg",
        detailModel: DetailModel(ingredients: [
          WordItem("ข้าวเหนียว", "Sticky rice"),
          WordItem("มะพร้าว", "Coconut"),
          WordItem("กะทิ", "Coconut milk"),
          WordItem("เมล็ดงา", "Sesame seeds"),
          WordItem("มะม่วงปลอกเปลือก", "mangoes peeled"),
          WordItem("งาอบ", "Toasted sesame seeds"),
        ], vocabulary: [
          WordItem("โรย", "Sprinkle")
        ], conversation: [
          WordItem("รสชาติเป็นยังไง?", "How does it taste?"),
          WordItem("รสชาติเป็นยังไง?", "What does it taste like?"),
          WordItem("มันมีรสหวาน", "It tastes sweet"),
          WordItem("คุณสามารถทานกับมะม่วงได้", "You can eat it with mangoes")
        ], benefits: [
          WordItem("มะม่วงมีวิตามิน ซี สูง", "Mangoes are high in vitamin C"),
          WordItem("มะม่วงอุดมไปด้วยเส้นใยสูง", "Mangoes contain high fiber"),
          WordItem("มะม่วงอุดมไปด้วยโพแทสเซียม ซึ่งสามารถช่วยลดความดันโลหิตได้",
              "Mangoes contain potassium which can lower blood pressure"),
        ], sideEffect: [
          WordItem("ข้าวเหนียวในน้ำกะทิมีน้ำตาลเยอะ",
              "Sticky rice in coconut milk contains high sugarand fat"),
          WordItem("สามารถเพิ่มน้ำหนักได้ถ้าคุณทานเยอะเกินไป",
              "You can gain weight if you eat too much of it"),
          WordItem("มะม่วงสุกมีน้ำตาลสูง", "Ripe mangos have high sugar"),
        ])),
    ItemData("ข้าวจี่", "Grilled sticky rice",
        image:
            "images/KhaoThai/GrilledStickyRice/4620693218534908066.5bb6acf7b150e4362e9455d4fa6fa7e9.19062511.jpg",
        gallery: [
          "images/KhaoThai/GrilledStickyRice/4620693218534575887.4068aff98f2555bdef173b7da7a49a30.19061312.jpg",
          "images/KhaoThai/GrilledStickyRice/4620693218534908066.4416fed782055d40a5867def2f87a50e.19062511.jpg",
          "images/KhaoThai/GrilledStickyRice/4620693218534908066.aef3742482fbb7ec77bab4f0de5345ab.19062511.jpg",

        ],
        detailModel: DetailModel(
          ingredients: [
            WordItem("ข้าวเหนียว", "Sticky rice"),
            WordItem("เกลือ", "Salt"),
            WordItem("ไข่", "Eggs"),
            WordItem("น้ำมัน", "Oil"),
          ],
          steps: [
            WordItem("นำข้าวเหนียวมาเสียบไม้", "Sticky rice is skewered"),
            WordItem("ทาข้างนอกข้าวเหนียวด้วยไข่และน้ำมัน",
                "Coat the rice side with egg and some oil"),
            WordItem(
                "นำไปปิ้งไปเตาถ่าน", "Grill it on a chimney full of charcoal"),
            WordItem("เมื่อสุกให้โรยเกลือ", "Add some salt"),
          ],
          vocabulary: [
            WordItem("แนะนำรับประทานเมนูนี้ช่วงฤดูหนาว",
                "This menu is recommended in winter")
          ],
        )),
    ItemData("ขนมเทียน", "Sweet stuffed dough pyramid",
        image:
            "images/KhaoThai/SweetStuffedDoughPyramid/4620693218536220936.440cf8ddb44e3ea8afd972720c2d19a8.19081010.jpg",
        gallery: [
          "images/KhaoThai/SweetStuffedDoughPyramid/4620693218536220936.c57d436789233423914801959078e60f.19081010.jpg"
        ],
        detailModel: DetailModel(
          ingredients: [
            WordItem("แป้งข้าวเหนียว", "Glutinous rice Flour"),
            WordItem("น้ำตาลปึก", "Palm Sugar"),
            WordItem("กะทิ", "Coconut Milk"),
          ],
          filling: [
            WordItem("เนื้อมะพร้าว", "Coconut Meat"),
            WordItem("ถั่วเขียว", "Mung Bean"),
            WordItem("เผือก", "Taro")
          ],
          vocabulary: [
            WordItem("หวาน", "Sweet"),
            WordItem("ไส้ขนม", "Stuff"),
            WordItem("แป้ง", "Dough"),
            WordItem("ทรงพิรามิด", "Pyramid"),
            WordItem("ถั่วเขียว", "Mung bean"),
            WordItem("ไส้", "Filling"),
            WordItem("ตัดใบตองเป็นทรงกลม", "Banana leaves cut in round shape")
          ],
          conversation: [
            WordItem("รสชาติเป็นยังไง?", "How does it taste?"),
            WordItem(
                "มันมีรสชาติหวานและกลมกล่อม", "It tastes sweet and mellow"),
          ],
        )),
  ];
}

//WordItem("",""),
