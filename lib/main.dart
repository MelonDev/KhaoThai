import 'package:auto_size_text/auto_size_text.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_khao_thai/bloc/flow_bloc_delegate.dart';
import 'package:new_khao_thai/bloc/sound_controller/sound_controller_bloc.dart';
import 'package:new_khao_thai/data/TabFive.dart';
import 'package:new_khao_thai/data/TabFour.dart';
import 'package:new_khao_thai/data/TabOne.dart';
import 'package:new_khao_thai/data/TabThree.dart';
import 'package:new_khao_thai/data/TabTwo.dart';
import 'package:new_khao_thai/design/CustomDialog.dart';
import 'package:new_khao_thai/design/detail_page.dart';
import 'package:new_khao_thai/design/sound_dialog.dart';
import 'package:new_khao_thai/frailty_route.dart';
import 'package:new_khao_thai/model/ItemData.dart';
import 'package:new_khao_thai/model/MainMenuData.dart';

void main() {
  BlocSupervisor.delegate = FlowBlocDelegate();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BuildContext mainContext;

  @override
  Widget build(BuildContext context) {
    mainContext = context;

    return MultiBlocProvider(
      providers: [
        BlocProvider<SoundControllerBloc>(
            builder: (context) => SoundControllerBloc()..add(StandbyEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData(primaryColor: Colors.blue, backgroundColor: Colors.red),
        home: MyHomePage(title: 'ข้าวไทย'),
      ),
    );
  }
}

class MainTitleData {
  final String thaiTitle;
  final String engTitle;

  MainTitleData(this.thaiTitle, this.engTitle);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext mainContext;

  final List<MainTitleData> tabName = <MainTitleData>[
    //MainTitleData('อาหารว่างไทย', 'Thai desserts'),
    MainTitleData('ข้าวไทย', 'Thai rices'),
    MainTitleData('อาหารว่างไทย', 'Thai desserts'),
    MainTitleData('เครื่องดื่ม', 'Drinks'),
    MainTitleData('สินค้าสุขภาพ', 'Health product'),
    MainTitleData('บทสนทนา', 'Conversation'),
    MainTitleData('เพิ่มเติม', 'More'),

    //'อาหารว่างไทย',
    //'เครื่องดื่ม',
    //'สินค้าเพื่อสุขภาพ'
  ];

  List buildTextViews(int count) {
    List<Widget> strings = List();
    for (int i = 0; i < count; i++) {
      strings.add(new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Text("Item number " + i.toString(),
              style: new TextStyle(fontSize: 20.0))));
    }
    return strings;
  }

  BottomNavigationBarItem createBottomNavItem(
      String name, String activeIconPath, String inActiveIconPath) {
    return BottomNavigationBarItem(
      activeIcon: Image.asset(
        activeIconPath,
        color: Colors.white,
      ),
      icon: Image.asset(
        inActiveIconPath,
        color: Colors.white,
        fit: BoxFit.contain,
      ),
      //icon: Icon(CupertinoIcons.profile_circled),
      title: Text(
        name,
        style: TextStyle(fontSize: 12, fontFamily: 'SukhumvitSet'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mainContext = context;
    return _mainLayout();
  }

  Widget _mainLayout() {
    return Stack(
      children: <Widget>[
        CupertinoTabScaffold(
          // 4
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.black54,
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            items: <BottomNavigationBarItem>[
              createBottomNavItem(
                  this.tabName[0].thaiTitle,
                  'images/icons8-carbohydrates-filled-100.png',
                  'images/icons8-carbohydrates-100.png'),
              createBottomNavItem(
                  this.tabName[1].thaiTitle,
                  'images/icons8-confectionery-filled-100.png',
                  'images/icons8-confectionery-100.png'),
              createBottomNavItem(
                  this.tabName[2].thaiTitle,
                  'images/icons8-cafe-filled-100.png',
                  'images/icons8-cafe-100.png'),
              createBottomNavItem(
                  this.tabName[3].thaiTitle,
                  'images/icons8-spa-flower-filled-100.png',
                  'images/icons8-spa-flower-100.png'),
              createBottomNavItem(
                  this.tabName[4].thaiTitle,
                  'images/icons8-chat-100-filled.png',
                  'images/icons8-chat-100.png'),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 4);

            return CupertinoTabView(
              builder: (BuildContext context) {
                return PageHome(
                    index,
                    mainContext,
                    this.tabName[index].engTitle,
                    this.tabName[index].thaiTitle);
              },
              defaultTitle: '',
            );
            //return null;
          },
        )
      ],
    );
  }
}

class PageHome extends StatelessWidget {
  final String title;
  final String subTitle;

  final int position;

  final BuildContext mainContext;

  PageHome(this.position, this.mainContext, this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/paddy.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              //stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                //Colors.indigo,
                //Colors.red,
                //Colors.yellow,
                //Colors.blue
                Colors.transparent,
                Colors.black54
              ],
            )),
            child: Container(),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  //backgroundColor: Colors.white,

                  backgroundColor: Colors.black54,
                  actionsForegroundColor: Colors.blue,
                  leading: Align(
                    widthFactor: 1.0,
                    alignment: Alignment.center,
                    child: Text(
                      subTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SukhumvitSet'),
                    ),
                  ),
                  trailing: Align(
                      widthFactor: 0.5,
                      alignment: Alignment.center,
                      child: FlatButton(
                          onPressed: () {
                            showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                englishWord: title,
                                thaiWord: subTitle,
                              ),
                            );
                          },
                          padding:
                              EdgeInsets.only(right: 0, top: 2, bottom: 10),
                          child: Icon(
                            CupertinoIcons.volume_up,
                            color: Colors.white,
                          ))),
                  largeTitle: Text(this.title,
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'SukhumvitSet')),
                  //backgroundColor: Colors.red,
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 100.0, top: 20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      loadList(position, this.title, mainContext),
                    ),
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

List<Widget> loadList(int position, String from, BuildContext mainContext) {
  List<Widget> _list = [];
  if (position == 0) {
    tabOneList().forEach((slot) {
      _list.add(CardWidget(mainContext, Colors.blue, from, slot));
    });
  } else if (position == 1) {
    tabTwoList().forEach((slot) {
      _list.add(CardWidget(mainContext, Colors.blue, from, slot));
    });
  } else if (position == 2) {
    tabThreeList().forEach((slot) {
      _list.add(CardWidget(mainContext, Colors.blue, from, slot));
    });
  } else if (position == 3) {
    tabFourList().forEach((slot) {
      _list.add(CardWidget(mainContext, Colors.blue, from, slot));
    });
  } else if (position == 4) {
    tabFiveList().forEach((slot) {
      _list.add(CardWidget(mainContext, Colors.blue, from, slot));
    });
  }

  return _list;
}

class CardWidget extends StatelessWidget {
  final Color color;
  final String from;
  final BuildContext tabContext;
  final ItemData itemData;

  CardWidget(this.tabContext, this.color, this.from, this.itemData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
              tabContext,
              FrailtyRoute(
                  builder: (BuildContext context) => DetailPage(
                        from: from,
                        itemData: itemData,
                      )));

          /*Navigator.of(context, rootNavigator: true)
              .push(new CupertinoPageRoute(
            title: "Click me",
            //fullscreenDialog: true,
            builder: (BuildContext context) => DetailPage(this.from),
          ));



           */
        },
        child: Hero(
            tag: "MAIN_CARD_S_${from}_${itemData.englishName}",
            child: Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  color: Colors.black54,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      itemData.image.length > 0
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: itemData.image != null
                                  ? Image.asset(
                                      itemData.image,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "https://i.ytimg.com/vi/IsIZNiQ26no/maxresdefault.jpg",
                                      fit: BoxFit.cover,
                                    ),
                            )
                          : Container(),
                      Container(
                        color: itemData.image.length > 0 ? Colors.black.withOpacity(0.7) :Colors.transparent,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(itemData.thaiName,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'SukhumvitSet')),
                            Container(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text(itemData.englishName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white54,
                                      fontFamily: 'SukhumvitSet')),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ))));
  }
}
