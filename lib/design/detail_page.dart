import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_khao_thai/design/CustomDialog.dart';
import 'package:new_khao_thai/design/gallery_page.dart';
import 'package:new_khao_thai/frailty_route.dart';
import 'package:new_khao_thai/model/DessertModel.dart';
import 'package:new_khao_thai/model/ItemData.dart';
import 'package:new_khao_thai/model/WordItem.dart';

class DetailPage extends StatefulWidget {
  final String from;
  final ItemData itemData;

  DetailPage({Key key, this.from, this.itemData}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  AudioPlayer _audioPlayer;

  List<WordItem> _wordList = [];

  @override
  Widget build(BuildContext context) {
    _audioPlayer = new AudioPlayer();

    _wordList.clear();
    initWordList();

    print(widget.from);
    return Hero(
        tag: "MAIN_CARD_${widget.from}_${widget.itemData.englishName}",
        child: Material(
          color: Colors.black,
          //child: _getMainLayout(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _getMainLayout(),
          ),
        ));
  }

  Widget _getMainLayout() {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'images/paddy.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black38,
          child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            englishWord: "Detail",
                            thaiWord: "รายละเอียด",
                          ),
                        );
                      },
                      padding: EdgeInsets.only(right: 0, top: 2, bottom: 10),
                      child: Icon(
                        CupertinoIcons.volume_up,
                        color: Colors.white,
                        size: 32,
                      ))
                ],
                title: Text("รายละเอียด",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SukhumvitSet',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                backgroundColor: Colors.black54,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: ListView.builder(
                  padding: EdgeInsets.only(bottom: 140),
                  //itemCount: _getCountOfContent(widget.from),
                  itemCount: 3 + _wordList.length,
                  itemBuilder: (BuildContext context, int position) {
                    if (position == 0) {
                      return _getNameSlot("English name", "ชื่อภาษาอังกฤษ",
                          widget.itemData.englishName, "ENGLISH", 30);
                    } else if (position == 1) {
                      return _getNameSlot("Thai name", "ชื่อภาษาไทย",
                          widget.itemData.thaiName, "THAI", 16);
                    } else if (position == 2) {
                      return widget.itemData.image.length > 0
                          ? _getImageSlot("Picture", "รูปภาพ",
                              widget.itemData.image, "IMAGE", 16)
                          : Container();
                    }
                    /* else if (_isDessertMode(widget.from)) {
                      if (widget.itemData.detailModel != null) {
                        if (widget.itemData.detailModel.ingredients != null) {
                          int total = _getCountOfContent(widget.from);
                          int dPos = total -
                              (total - position) -
                              (total -
                                  widget.itemData.detailModel.ingredients
                                      .length -
                                  1);
                          if (dPos == 0) {
                            return _getIngredientListTitleLayout();
                          } else if (dPos == 1) {
                            return _getIngredientItem(
                                widget.itemData.detailModel
                                    .ingredients[dPos - 1],
                                false);
                          } else {
                            return _getIngredientItem(
                                widget.itemData.detailModel
                                    .ingredients[dPos - 1],
                                true);
                          }
                        }  else {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    }
                     */
                    else {
                      int mPosition = position - 3;
                      WordItem slot = _wordList[mPosition];
                      if (slot is TitleWordItem) {
                        return _getIngredientListTitleLayout(slot);
                      } else if (slot is ChatWordItem) {
                        return _getChatItem(slot);
                      } else {
                        if (mPosition > 0) {
                          if (_wordList[mPosition - 1].thai.contains("TITLE")) {
                            return _getIngredientItem(
                                _wordList[mPosition], false);
                          }
                        }

                        return _getIngredientItem(_wordList[mPosition], true);
                      }
                    }
                  }),
            ),
          ),
        )
      ],
    );
  }

  initWordList() {
    if (widget.itemData.detailModel != null) {
      DetailModel detailModel = widget.itemData.detailModel;
      if (detailModel.ingredients != null) {
        _wordList.add(TitleWordItem("วัตถุติบ", "Ingredient"));
        _wordList.addAll(detailModel.ingredients);
      }

      if (detailModel.filling != null) {
        _wordList.add(TitleWordItem("ไส้", "Filling"));
        _wordList.addAll(detailModel.filling);
      }
      if (detailModel.steps != null) {
        _wordList.add(TitleWordItem("ขั้นตอน", "Steps"));
        _wordList.addAll(detailModel.steps);
      }
      if (detailModel.vocabulary != null) {
        _wordList.add(TitleWordItem("คำศัพท์", "Vocabulary"));
        _wordList.addAll(detailModel.vocabulary);
      }

      if (detailModel.conversation != null) {
        _wordList.add(TitleWordItem("บทสนทนา", "Conversation"));
        _wordList.addAll(detailModel.conversation);
      }

      if (detailModel.benefits != null) {
        _wordList.add(TitleWordItem("ประโยชน์", "Benefit"));
        _wordList.addAll(detailModel.benefits);
      }
      if (detailModel.sideEffect != null) {
        _wordList.add(TitleWordItem("ผลเสีย", "Side Effect"));
        _wordList.addAll(detailModel.sideEffect);
      }
      if (detailModel.properties != null) {
        _wordList.add(TitleWordItem("สรรพคุณ", "Properties"));
        _wordList.addAll(detailModel.properties);
      }
      if (detailModel.usage != null) {
        _wordList.add(TitleWordItem("วิธีการใช้", "Usage"));
        _wordList.addAll(detailModel.usage);
      }
      if (detailModel.storage != null) {
        _wordList.add(TitleWordItem("การเก็บรักษา", "Storage"));
        _wordList.addAll(detailModel.storage);
      }
      if (detailModel.chatConversation != null) {
        for (var slot in detailModel.chatConversation) {
          _wordList.add(TitleWordItem(slot.thaiName, slot.englishName));
          _wordList.add(TitleWordItem("SPACING", "SPACING"));
          _wordList.addAll(slot.conversation);
          _wordList.add(TitleWordItem("SPACING", "SPACING"));
        }
        //_wordList.addAll(detailModel.chatConversation);
      }

      /*if (detailModel.filling != null) {
          count += 1;
          count += detailModel.filling.length;
        }
        print(count);

         */

    }
  }

  int _getCountOfContent(String type) {
    int count = 3;

    if (type.contains("Thai desserts")) {
      if (widget.itemData.detailModel != null) {
        DetailModel detailModel = widget.itemData.detailModel;
        if (detailModel.ingredients != null) {
          //count += 1;
          //print(detailModel.ingredients.length);
          count += 1;
          count += detailModel.ingredients.length;
        }

        /*if (detailModel.filling != null) {
          count += 1;
          count += detailModel.filling.length;
        }
        print(count);

         */

      }
    }
    return count;
  }

  bool _isDessertMode(String type) {
    if (type.contains("Thai desserts")) {
      if (widget.itemData.detailModel != null) {
        DetailModel detailModel = widget.itemData.detailModel;
        if (detailModel.ingredients != null) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  }

  Widget _getIngredientListTitleLayout(WordItem wordItem) {
    if (wordItem.english.contains("SPACING") &&
        wordItem.thai.contains("SPACING")) {
      return Container(
          padding: EdgeInsets.only(top: 20, left: 0, right: 0),
          color: Colors.black54);
    } else {
      return Container(
          margin: wordItem.thai.length > 0 && wordItem.english.length > 0
              ? EdgeInsets.only(top: 20, left: 0, right: 0)
              : EdgeInsets.only(top: 30, left: 0, right: 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: wordItem.thai.length > 0 && wordItem.english.length > 0
                      ? Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: Text(
                                  "${wordItem.thai}\n(${wordItem.english})",
                                  style: TextStyle(
                                      color: Colors.white.withAlpha(180),
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 60,
                              child: Center(
                                child: MaterialButton(
                                  elevation: 0,
                                  hoverElevation: 0,
                                  highlightElevation: 0,
                                  focusElevation: 0,
                                  splashColor: Colors.black87,
                                  onPressed: () {
                                    //kaksfkplayAudio(context, type, name);
                                    showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog(
                                        englishWord: wordItem.english,
                                        thaiWord: wordItem.thai,
                                      ),
                                    );
                                  },
                                  height: 50,
                                  color: Colors.black.withAlpha(180),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  child: Icon(
                                    Icons.volume_up,
                                    size: 27,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : Container(),
                )
              ]));
    }
  }

  Widget _getNameSlot(String titleEng, String titleThai, String name,
      String type, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, left: 0, right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  child: Text("$titleThai\n($titleEng)",
                      style: TextStyle(
                          color: Colors.white.withAlpha(180),
                          fontFamily: 'SukhumvitSet',
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 60,
                  child: Center(
                    child: MaterialButton(
                      elevation: 0,
                      hoverElevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      splashColor: Colors.black87,
                      onPressed: () {
                        //kaksfkplayAudio(context, type, name);
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            englishWord: titleEng,
                            thaiWord: titleThai,
                          ),
                        );
                      },
                      height: 50,
                      color: Colors.black.withAlpha(180),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Icon(
                        Icons.volume_up,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                color: Colors.black54),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: 16, bottom: 16, left: 20, right: 20),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              child: Text(name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 60,
                              child: Center(
                                child: MaterialButton(
                                  elevation: 0,
                                  hoverElevation: 0,
                                  highlightElevation: 0,
                                  focusElevation: 0,
                                  splashColor: Colors.black87,
                                  onPressed: () {
                                    playAudio(context, type, name);
                                  },
                                  height: 50,
                                  color: Colors.white.withAlpha(240),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  child: Icon(
                                    Icons.volume_up,
                                    size: 27,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      _getSubName(_getSubNameFromItem(type), type)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String _getSubNameFromItem(String lang) {
    if (lang.contains("THAI")) {
      return widget.itemData.subThaiName;
    } else if (lang.contains("ENGLISH")) {
      return widget.itemData.subEnglishName;
    } else {
      return "";
    }
  }

  Widget _getChatItem(ChatWordItem wordItem) {
    if (wordItem != null) {
      return Container(
          margin: EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              color: Colors.black54),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: wordItem.asking
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          englishWord: wordItem.english,
                          thaiWord: wordItem.thai,
                        ),
                      );
                    },
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 32
                      ),
                      child: Bubble(
                        elevation: 0,
                        margin: BubbleEdges.only(
                            top: 10, right: 0, left: 0, bottom: 10),
                        nipHeight: 16,
                        radius: Radius.circular(16.0),
                        nip: wordItem.asking
                            ? BubbleNip.leftTop
                            : BubbleNip.rightTop,
                        color: wordItem.asking ? Colors.amber : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: RichText(
                            textAlign: wordItem.asking ? TextAlign.left : TextAlign.right,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: wordItem.english,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )),
                              TextSpan(
                                  text: "\n(${wordItem.thai})",
                                  style: TextStyle(
                                      color: Colors.black.withAlpha(200),
                                      fontFamily: 'SukhumvitSet',
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal
                                  )),
                            ]),
                          ),
                          /*child: Text(
                         "${wordItem.english}\n(${wordItem.thai})",
                         textAlign:
                         wordItem.asking ? TextAlign.left : TextAlign.right,
                         style: TextStyle(
                           color: wordItem.asking ? Colors.black : Colors.black,
                           fontFamily: 'SukhumvitSet',
                           fontSize: 20,
                         ),
                       ),*/
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ));
    } else {
      return Container();
    }
  }

  Widget _getIngredientItem(WordItem wordItem, bool showIndicator) {
    if (wordItem != null) {
      return Container(
          margin: EdgeInsets.only(top: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              color: Colors.black54),
          child: Column(
            children: <Widget>[
              showIndicator
                  ? Container(
                      height: 1,
                      color: Colors.white24,
                      width: MediaQuery.of(context).size.width,
                    )
                  : Container(),
              Container(
                margin:
                    EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 120,
                      child: Text("${wordItem.english}\n(${wordItem.thai})",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SukhumvitSet',
                              fontSize: 22,
                              fontWeight: FontWeight.normal)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      width: 60,
                      child: Center(
                        child: MaterialButton(
                          elevation: 0,
                          hoverElevation: 0,
                          highlightElevation: 0,
                          focusElevation: 0,
                          splashColor: Colors.black87,
                          onPressed: () {
                            //playAudio(context, type, "HELLO");
                            showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                englishWord: wordItem.english,
                                thaiWord: wordItem.thai,
                              ),
                            );
                          },
                          height: 50,
                          color: Colors.white.withAlpha(240),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          child: Icon(
                            Icons.volume_up,
                            size: 27,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ));
    } else {
      return Container();
    }
  }

  Widget _getSubName(String word, String type) {
    if (word != null) {
      return Column(
        children: <Widget>[
          Container(
            height: 1,
            color: Colors.white24,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  child: Text(word,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SukhumvitSet',
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 60,
                  child: Center(
                    child: MaterialButton(
                      elevation: 0,
                      hoverElevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      splashColor: Colors.black87,
                      onPressed: () {
                        playAudio(context, type, word);
                      },
                      height: 50,
                      color: Colors.white.withAlpha(240),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Icon(
                        Icons.volume_up,
                        size: 27,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getImageSlot(String titleEng, String titleThai, String name,
      String type, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, left: 0, right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  child: Text("$titleThai\n($titleEng)",
                      style: TextStyle(
                          color: Colors.white.withAlpha(180),
                          fontFamily: 'SukhumvitSet',
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 60,
                  child: Center(
                    child: MaterialButton(
                      elevation: 0,
                      hoverElevation: 0,
                      highlightElevation: 0,
                      focusElevation: 0,
                      splashColor: Colors.black87,
                      onPressed: () {
                        //kaksfkplayAudio(context, type, name);
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            englishWord: titleEng,
                            thaiWord: titleThai,
                          ),
                        );
                      },
                      height: 50,
                      color: Colors.black.withAlpha(180),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      child: Icon(
                        Icons.volume_up,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 0, right: 0),
            width: MediaQuery.of(context).size.width,
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                color: Colors.black54),
            child: Image.asset(
              name,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  color: Colors.black54),
              child: MaterialButton(
                color: Colors.blue.withAlpha(200),
                splashColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      FrailtyRoute(
                          builder: (BuildContext context) => GalleryPage(
                                itemData: widget.itemData,
                              )));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(top: 6, bottom: 6, left: 0, right: 0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 102,
                            child: Text("รูปภาพทั้งหมด",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SukhumvitSet',
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 22,
                                color: Colors.white.withAlpha(220),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  encodeURL(String lang, String word) {
    if (lang.contains("ENGLISH")) {
      var uri =
          'https://translate.google.com/translate_tts?ie=UTF-8&q=$word&tl=en&client=tw-ob';
      return Uri.encodeFull(uri);
    } else if (lang.contains("THAI")) {
      var uri =
          'https://translate.google.com/translate_tts?ie=UTF-8&q=$word&tl=th-TH&client=tw-ob';
      return Uri.encodeFull(uri);
    } else {
      return "";
    }
  }

  playAudio(BuildContext context, String lang, String word) {
    var encoded = encodeURL(lang, word);
    play(context, encoded).then((value) {
      //Navigator.pop(context);
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> play(BuildContext context, String kUrl) async {
    await _audioPlayer.play(kUrl).then((_) {
      print("inPass");
    }).catchError((e) {
      print("ERROR");
    });
  }
}
