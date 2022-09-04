import 'package:flutter/material.dart';
import 'package:uzclub/app/utils/dimens.dart';
import 'package:uzclub/presentation/screens/main/chat/chat_screen.dart';
import 'package:uzclub/presentation/screens/main/profile/profile_screen.dart';
import 'package:uzclub/presentation/screens/main/settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPosition = 1;
  final List<Widget> _mainScreensList = [
    const ProfileScreen(),
    const ChatScreen(),
    const SettingsScreen(),
  ];
  final List<bool> _clickedItem = [false, true, false];

  var hasMessage = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentPosition == 0) {
          return true;
        } else {
          changeMenuItem(0);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _mainScreensList[_currentPosition],
        bottomNavigationBar: Material(
            elevation: margin_padding_12,
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      changeMenuItem(0);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/images/main/profile.png",
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                        color: !_clickedItem[0] ? Colors.blueGrey : green,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeMenuItem(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/images/main/chat.png",
                        height: 30,
                        width: 30,
                        fit: BoxFit.fill,
                        color: !_clickedItem[1] ? Colors.blueGrey : green,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeMenuItem(2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/images/main/settings.png",
                        height: 25,
                        width: 25,
                        fit: BoxFit.fill,
                        color: !_clickedItem[2] ? Colors.blueGrey : green,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void changeMenuItem(int i) {
    for (int j = 0; j < _mainScreensList.length; j++) {
      setState(() {
        _clickedItem[j] = false;
      });
    }
    setState(() {
      _clickedItem[i] = true;
      _currentPosition = i;
    });
  }
}
