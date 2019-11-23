import 'package:flutter/cupertino.dart';
import 'package:new_khao_thai/model/DessertModel.dart';
import 'package:new_khao_thai/model/ItemData.dart';
import 'package:new_khao_thai/model/WordItem.dart';

List<ItemData> tabFiveList() {
  return [
    ItemData("การถามราคา", "Asking about price",
        image: "",
        detailModel: DetailModel(
          conversation: [
            WordItem("ราคาเท่าไร?", "How much is it?"),
            WordItem("ราคาเท่าไร?", "How much are they?"),
            WordItem("ราคาเท่าไร?", "How much does it cost?"),
            WordItem("ราคา 100 บาท", "It’s 100 baht"),
          ],
        )),
    ItemData("การต่อรองราคา", "Negotiation of a price",
        image: "",
        detailModel: DetailModel(conversation: [
          WordItem("ลดราคาลงได้ไหม?", "Can you lower me the price?"),
          WordItem("ลดราคาลงได้ไหม?", "Can you give me a discount?"),
        ], chatConversation: [
          ConversationModel("บทสนทนาชุดที่ 1", "Conversation 1", conversation: [
            ChatWordItem("สวัสดี", "Hello!", false),
            ChatWordItem("สวัสดี สบายดีไหม?", "Hi. How are you?", true),
            ChatWordItem(
                "ไม่เลว แล้วคุณล่ะ?", "Not bad. What about you?", false),
            ChatWordItem("สบายดี", "I’m good", true),
            ChatWordItem("วันนี้คุณขายอะไร?", "What do you sell today?", false),
            ChatWordItem("ฉันขายข้าวแต๋น ลองชิมไหม?",
                "I sell crispy rice cakes. Do you want to try?", true),
            ChatWordItem("ดูน่ากิน รสชาติเป็นอย่างไร?",
                "It looks delicious. How does it taste?", false),
            ChatWordItem("รสกรอบและหวาน", "It tastes crispy and sweet", true),
            ChatWordItem(
                "วัตถุดิบมีอะไรบ้าง?", "What are the ingredients?", false),
            ChatWordItem(
                "วัตถุดิบได้แก่ ข้าวเหนียวตากแห้ง น้ำแตงโม น้ำอ้อย",
                "The ingredients are dried sticky rice, water melon juice, and sugarcane",
                true),
            ChatWordItem("ดูดีนะ ราคาเท่าไร?",
                "Wow, that looks great. How much is it?", false),
            ChatWordItem("ถุงละ 40 บาท", "40 baht a pack", true),
            ChatWordItem("ขอ 5 ถุง ลดราคาให้หน่อยได้ไหม?",
                "I want to buy 5 packs. Can you give me a discount?", false),
            ChatWordItem("คิด 195 บาท", "That would be 195 Baht", true),
            ChatWordItem("ตกลงรับ 5 ถุง", "Ok, I have 5 packs then", false),
          ]),
          ConversationModel("บทสนทนาชุดที่ 2", "Conversation 2", conversation: [
            ChatWordItem("สวัสดี", "Hello!", false),
            ChatWordItem("สวัสดี สบายดีไหม?", "Hi. How’s it going?", true),
            ChatWordItem("สบายดี และคุณล่ะ?", "I’m fine, and you?", false),
            ChatWordItem("สบายดี", "I’m good", true),
            ChatWordItem("วันนี้คุณขายอะไร?", "What do you sell today?", false),
            ChatWordItem(
                "นี่คือขนมเทียน", "This is sweet stuffed dough pyramid", true),
            ChatWordItem("ดูน่าอร่อย", "It looks yummy", false),
            ChatWordItem(
                "รสชาติเป็นอย่างไร?", "What does it taste like?", false),
            ChatWordItem("รสหวานและนุ่ม", "It tastes sweet and mellow", true),
            ChatWordItem("รับประทานอย่างไร?", "How can I eat this?", false),
            ChatWordItem(
                "คุณต้องแกะใบตองก่อน และทานขนมข้างใน",
                "You must unwrap the banana leaves first, then you can have a bite",
                true),
            ChatWordItem(
                "มีวัตถุดิบอะไรในขนมบ้าง?", "What are the ingredients?", false),
            ChatWordItem(
                "วัตถุดิบได้แก่แป้งข้าวเหนียว น้ำกะทิ และน้ำตาลปึก",
                "The ingredients are sticky rice flour, coconut milk and palm sugar",
                true),
            ChatWordItem("ราคาเท่าไร", "How much is it?", false),
            ChatWordItem("อันละ 2 บาท", "It’s 2 Baht each", true),
            ChatWordItem(
                "ว๊าว รับ 5 ชิ้น", "Wow, I’ll have 5 pieces please", false),
            ChatWordItem("นี่ค่ะ", "Here you are", true),
            ChatWordItem("ขอบคุณ", "Thank you", false),
          ]),
          ConversationModel("บทสนทนาชุดที่ 3", "Conversation 3", conversation: [
            ChatWordItem("สวัสดี มีอะไรไห้ช่วยไหม?",
                "Hello there. Can I help you?", false),
            ChatWordItem("สิ่งเหล่านี้คืออะไร?", "Yes, what are these?", false),
            ChatWordItem("พวกมันคือขนมไทยชื่อว่า ข้าวต้มมัด",
                "They are a Thai snack called Kaw Tom Mud", false),
            ChatWordItem("มันคืออะไร?", "What is it?", false),
            ChatWordItem(
                "มันคือข้าวเหนียวและกล้วยที่ถูกห่อด้วยใบตองแล้วเอาไปต้ม มันหวานและอร่อยมาก",
                "It is sticky rice and boiled banana wrapped in a banana leaf. It is very sweet and delicious",
                false),
            ChatWordItem("ฟังแล้วดูอร่อยจัง ราคาเท่าไหร่?",
                "That sounds nice. How much are they?", false),
            ChatWordItem("คู่ละ 10 บาท", "They are 10 Baht for a pair", false),
            ChatWordItem("โอเค ขอ 4 คู่", "Okay can I have 4 please", false),
            ChatWordItem("ได้ค่ะ นี่ค่ะ ทั้งหมด 20 บาท",
                "Yes, here you are. That’s 20 Baht", false),
            ChatWordItem("นี่ 100 บาท", "Here is 100 Baht", false),
            ChatWordItem("นี่ค่ะ เงินทอน 80 บาท",
                "Okay, I’ll give you 80 Baht change. Here you are", false),
            ChatWordItem("ขอบคุณ", "Thank you", false),
            ChatWordItem(
                "โอเค ด้วยความยินดี จำไว้นะ แกะใบตองออกก่อนทาน กรุณาอย่าทานใบตอง โอเคนะ",
                "You are welcome. Remember to unwrap the banana leaf first and eat the snack. Please don’t eat the banana leaf, okay?",
                false),
          ])
        ])),
    ItemData("ถามเพื่อความชัดเจน", "Asking for clarification",
        image: "",
        detailModel: DetailModel(conversation: [
          WordItem("ขอโทษค่ะ ช่วยย้ำอีกทีได้ไหม?",
              "I’m sorry. Could you repeat that please?"),
          WordItem("ขอโทษค่ะ ฉันไม่ได้ยิน กรุณาพูดอีกทีช้าๆ ได้ไหม",
              "I’m sorry I didn’t hear you. Could you please say that again slowly?"),
          WordItem("ขอโทษค่ะ?", "Pardon?"),
          WordItem("ขอโทษค่ะ?", "Excuse me?"),
          WordItem("ตะกี้พูดอะไรนะคะ?", "What was that?"),
          WordItem("ช่วยพูดอีกทีได้ไหมค่ะ?", "Say that again please?"),
          WordItem("ฉันขอโทษ ฉันไม่เข้าใจว่ามันแปลว่าอะไร",
              "I’m sorry. I don’t understand what that means"),
          WordItem("คุณหมายถึงอะไร?", "What do you mean?"),
          WordItem("คุณช่วยยกตัวอย่างให้ฉันได้ไหม?",
              "Could you give me an example, please?"),
        ])),
    ItemData("การยกตัวอย่าง", "Phrases to say when you’re clarifying",
        image: "",
        detailModel: DetailModel(vocabulary: [
          WordItem("ยกตัวอย่างเช่น", "For example"),
          WordItem("พูดอีกแบบว่า", "In other words"),
          WordItem("ฉันจะพูดว่า", "I would say that"),
          WordItem("ตัวอย่างการแสดงออกของการถามและการชี้แจงในบทสนทนา",
              "Examples of Expression of Asking and Giving Clarification in dialogue"),
        ], chatConversation: [
          ConversationModel("บทสนทนาชุดที่ 4", "Conversation 4", conversation: [
            ChatWordItem("นี่คืออะไร?", "What is this?", false),
            ChatWordItem("มันคือข้าวยำ", "This is Khao Yum", true),
            ChatWordItem("พูดอีกครั้งได้ไหมคะ", "Say that again please", false),
            ChatWordItem("ข้าว ยำ", "Khao Yum", true),
            ChatWordItem("ฉันขอโทษ ฉันไม่เข้าใจ",
                "I’m sorry I don’t understand that?", false),
            ChatWordItem("ฉันจะพูดว่ามันคือ ไทยไรซ์สไปซี่สลัด",
                "I would say that it’s a Thai rice spicy salad", true),
            ChatWordItem("โอ้ ฉันเข้าใจแล้ว แล้วมีส่วนผสมอะไรบ้างคะ?",
                "Oh I see. What are the ingredients?", false),
            ChatWordItem("เราใช้ข้าวออแกนิคบ้าง และใช้สมุนไพรเยอะๆ",
                "We use some organic rice and a lot of Thai herbs", true),
            ChatWordItem("คุณช่วยยกตัวอย่างได้ไหมคะ",
                "Could you give an example please?", false),
            ChatWordItem(
                "สมุนไพรไทยที่เราใช้มีตัวอย่างคือ ตะไคร้ ขิง น้ำมะนาว มะม่วงซอย หอมแดง และต้นหอม",
                "Thai herbs that we use are for example lemon grass, galangal, lime juice, sliced mango, red onion, and some shallots",
                true),
            ChatWordItem(
                "ว้าว น่าสนใจจัง ฉันขอ 1 ชิ้นค่ะ เท่าไหร่คะ?",
                "Wow, sounds interesting. I’ll have one please. How much is it?",
                false),
            ChatWordItem("35 บาท", "It’s 35 Baht", true),
            ChatWordItem("อะไรนะ?", "Sorry?", false),
            ChatWordItem("35 บาท", "35 Baht", true),
          ]),
          ConversationModel("บทสนทนาชุดที่ 5", "Conversation 5", conversation: [
            ChatWordItem("ขอโทษค่ะ ในภาษาอังกฤษเรียกว่าอะไร?",
                "Excuse me, what do you call this thing in English?", false),
            ChatWordItem(
                "เรียกว่า ลูกประคบสมุนไพร", "It is a herbal ball", true),
            ChatWordItem("อะไรนะคะ?", "Pardon?", false),
            ChatWordItem("ลูกประคบสมุนไพร", "A herbal ball", true),
            ChatWordItem("เอาไว้ทำอะไร?", "What is it used for?", false),
            ChatWordItem("เอาไว้ประคบร้อน",
                "It’s used for hot compressed massage", true),
            ChatWordItem("คุณหมายถึงอะไร?", "What do you mean?", false),
            ChatWordItem(
                "หมายถึงว่า คุณใช้มันเพื่อการนวดที่บ้าน มันใช้ง่าย คุณแค่แช่ลูกประคบในน้ำ 3 นาที แล้วอุ่นในไมโครเวฟ 1 ถึง 2 นาที",
                "I mean you can use it at home for massaging. It’s easy to use. You just soak the herbal ball in the water for 3 minutes. Then warm it in a microwave for 1 to 2 minutes",
                true),
            ChatWordItem("มีอะไรอยู่ข้างในลูกประคบบ้าง?",
                "What are inside the herbal ball?", false),
            ChatWordItem(
                "เราใช้ข้าวอินทรีย์และสมุนไพรไทย เพื่อการผ่อนคลายอย่างล้ำลึกและลดความเจ็บปวด",
                "We use organic rice and some Thai herbs for deep relaxation and pain relief",
                true),
            ChatWordItem(
                "คุณหมายความว่ามันดีต่อการผ่อนคลาย เพราะจากกลิ่นหอมของสมุนไพรไทย?",
                "You mean it is good for relaxing because of the aroma from Thai herbs?",
                false),
            ChatWordItem("ใช่ถูกต้อง", "Yes, that’s right", true),
            ChatWordItem(
                "คุณช่วยยกตัวอย่างของสมุนไพรไทยในลูกประคบได้ไหม?",
                "Could you give me some examples of the Thai herbs inside the herbal ball?",
                false),
            ChatWordItem(
                "เราใช้ใบมะขาม ไพล เปลือกส้ม ผิวมะกรูด และขิง",
                "We use some dried tamarind leaves, Bengal root, orange peel, kaffir lime skin and ginger",
                true),
            ChatWordItem("ว้าว ฉันชอบมากเลย", "Wow, I love them!", false),
          ]),
        ]))
  ];
}
/*
ConversationModel("", "", conversation: [
ChatWordItem("", "", false),
ChatWordItem("", "", false),
])
 */
