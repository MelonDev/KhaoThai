import 'package:new_khao_thai/model/WordItem.dart';

class DetailModel {
  final List<WordItem> ingredients;
  final List<WordItem> filling;
  final List<WordItem> vocabulary;
  final List<WordItem> conversation;
  final List<WordItem> benefits;
  final List<WordItem> sideEffect;
  final List<WordItem> steps;
  final List<WordItem> properties;
  final List<WordItem> usage;
  final List<WordItem> storage;

  final List<ConversationModel> chatConversation;

  DetailModel({
    this.ingredients,
    this.filling,
    this.vocabulary,
    this.conversation,
    this.benefits,
    this.sideEffect,
    this.steps,
    this.properties,
    this.usage,
    this.storage,
    this.chatConversation,
  });
}

class ConversationModel{
  final String thaiName;
  final String englishName;
  final List<ChatWordItem> conversation;

  ConversationModel(this.thaiName,this.englishName,{this.conversation});
}
