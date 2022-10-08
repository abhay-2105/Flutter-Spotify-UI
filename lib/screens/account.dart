import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/screens/home_screen.dart';
import 'package:spotify/screens/library.dart';
import 'package:spotify/screens/playlist_screen.dart';
import 'package:spotify/screens/search_screen.dart';
import 'package:spotify/screens/song_playing.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return const SongPlaying();
    },
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1);
      const end = Offset(0, 0);
      const curve = Curves.easeInCubic;

      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  int selectedIndex = 0;
  final List<Color> _colorsRandom = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i <= 10; i++) {
      _colorsRandom
          .add(Colors.primaries[Random().nextInt(Colors.primaries.length)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    void updateIndex(int newIndex) {
      setState(() {
        selectedIndex = newIndex;
      });
    }

    final List<Widget> screens = [
      HomeScreen(updateIndex),
      SearchScreen(_colorsRandom),
      const Library(),
      PlayListScreen(updateIndex)
    ];

    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            appBar: (selectedIndex == 2)
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(91),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: AppBar(
                        elevation: 0,
                        backgroundColor: selectedIndex == 2
                            ? Colors.black
                            : Colors.transparent,
                        toolbarHeight: 90,
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        title: selectedIndex == 2
                            ? const Text(
                                'Your Library',
                                style: TextStyle(color: Colors.white),
                              )
                            : null,
                        actions: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 20,
                            onPressed: () {
                              print('search');
                            },
                            icon: const Icon(
                              CupertinoIcons.search,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 20,
                            onPressed: () {
                              print('add');
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
            extendBody: true,
            body: screens[selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
                iconSize: 26,
                unselectedFontSize: 12,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex > 2 ? 0 : selectedIndex,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.93),
                onTap: (value) => setState(() {
                      selectedIndex = value;
                    }),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.recent_actors),
                    label: "Your Library",
                  )
                ]),
          ),
          Positioned(
            bottom: 55,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(_createRoute()),
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade900,
                            borderRadius: BorderRadius.circular(5)),
                        height: 53,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/thumbnail 3.jpg'),
                            const SizedBox(width: 10),
                            const Expanded(
                                child: Text(
                              'Patience • Take That ',
                              style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis),
                            )),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.laptop_windows,
                                      color: Colors.greenAccent.shade700,
                                      size: 22,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.greenAccent.shade700,
                                    )),
                                const Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SliderTheme(
                          data: SliderThemeData(
                              activeTrackColor: Colors.white,
                              trackHeight: 0.1,
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 0),
                              thumbShape: SliderComponentShape.noOverlay),
                          child: Slider(
                            inactiveColor: Colors.grey,
                            value: 0.2,
                            onChanged: (_) {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
