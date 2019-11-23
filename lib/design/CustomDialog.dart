import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_khao_thai/bloc/sound_controller/sound_controller_bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'dart:convert' show utf8;

class CustomDialog extends StatelessWidget {
  final String englishWord, thaiWord;

  BuildContext _context;

  SoundControllerBloc _soundControllerBloc;

  AudioPlayer _audioPlayer;

  reloadData() {
    _soundControllerBloc.add(EnglishTabSelectedEvent());
  }

  CustomDialog({@required this.englishWord, @required this.thaiWord});

  @override
  Widget build(BuildContext context) {
    _context = context;
    _audioPlayer = new AudioPlayer();

    _soundControllerBloc = BlocProvider.of<SoundControllerBloc>(context);

    reloadData();

    return Container(
      constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
      child: BlocBuilder<SoundControllerBloc, SoundControllerState>(
          builder: (context, _state) {
        return _dialogContent(context, _state);
      }),
    );
  }

  final Map<int, Widget> children = const <int, Widget>{
    0: Text('English'),
    1: Text('ภาษาไทย'),
  };

  Widget _dialogContent(BuildContext context, SoundControllerState _state) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 400,
        width: 300,
        child: Material(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 320,
                width: 300,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: Container(
                        color: Colors.blue,
                        child: DefaultTabController(
                          length: _buildTabs().length,
                          child: TabBar(
                            onTap: (position){
                              onValueChanged(position);
                            },
                            labelStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SukhumvitSet'),
                            //For Selected tab
                            unselectedLabelStyle: TextStyle(
                                fontSize: 16.0, fontFamily: 'SukhumvitSet'),
                            //For Un-selected Tabs
                            indicatorWeight: 1,
                            indicatorColor: Colors.white,
                            tabs: _buildTabs(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 180,
                      width: 300,
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        color: Colors.blue,
                        child: Center(
                          child: AutoSizeText(
                            stateToWordText(_state),
                            minFontSize: 14,
                            maxFontSize: 36,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 36,
                                fontFamily: 'SukhumvitSet',
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: 300,
                      child: _waveWidget(),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                width: 300,
                child: Container(
                  color: Colors.white,
                  child: CupertinoButton(
                      child: Text(
                        "เล่น",
                        style:
                            TextStyle(fontSize: 26, fontFamily: 'SukhumvitSet'),
                      ),
                      onPressed: () {
                        playAudio(context);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int currentSegment = 0;

  void onValueChanged(int newValue) {
    if (newValue == 0) {
      _soundControllerBloc.add(EnglishTabSelectedEvent());
    } else if (newValue == 1) {
      _soundControllerBloc.add(ThaiTabSelectedEvent());
    }
  }

  String stateToWordText(SoundControllerState _state) {
    if (_soundControllerBloc.state is EnglishSoundControllerState) {
      return englishWord;
    } else if (_soundControllerBloc.state is ThaiSoundControllerState) {
      return thaiWord;
    } else {
      return "";
    }
  }

  encodeURL() {
    if (_soundControllerBloc.state is EnglishSoundControllerState) {
      var uri =
          'https://translate.google.com/translate_tts?ie=UTF-8&q=$englishWord&tl=en&client=tw-ob';
      return Uri.encodeFull(uri);
    } else if (_soundControllerBloc.state is ThaiSoundControllerState) {
      var uri =
          'https://translate.google.com/translate_tts?ie=UTF-8&q=$thaiWord&tl=th-TH&client=tw-ob';
      return Uri.encodeFull(uri);
    } else {
      return "";
    }
  }

  playAudio(BuildContext context) {
    var encoded = encodeURL();
    play(context, encoded).then((value) {
      //Navigator.pop(context);
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> play(BuildContext context, String kUrl) async {
    await _audioPlayer.play(kUrl).then((onvalue) {
      print("inPass");
    }).catchError((e) {
      print("ERROR");
    });
    _audioPlayer.onPlayerCompletion.listen((event) {
      print("COM");
    });
    _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
    });
  }

  List<Widget> _buildTabs() {
    return <Widget>[
      Tab(text: "English"),
      Tab(text: "ภาษาไทย")
    ];
  }

  Widget _waveWidget() {
    return WaveWidget(
      config: CustomConfig(
        colors: [
          Colors.white70,
          Colors.white54,
          Colors.white30,
          Colors.white,
        ],
        durations: [17000, 10440, 5400, 3000],
        heightPercentages: [0.30, 0.43, 0.55, 0.70],
        blur: MaskFilter.blur(BlurStyle.solid, 0),
      ),
      waveAmplitude: 0,
      backgroundColor: Colors.blue,
      size: Size(
        MediaQuery.of(_context).size.width,
        80,
      ),
    );
  }
}
