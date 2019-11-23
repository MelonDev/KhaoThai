class WordItem {
  final String english;
  final String thai;

  WordItem(this.thai,this.english);
}

class TitleWordItem extends WordItem {


  TitleWordItem(thai,english) : super(thai, english);
}

class ChatWordItem extends WordItem {

  final bool asking;

  ChatWordItem(thai,english,this.asking) : super(thai, english);
}