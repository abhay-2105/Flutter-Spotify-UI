import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> _playlist = [
  'Liked Songs',
  'Hindi Songs',
  'Top of the world',
  '!R',
  'Hindi Lofi',
  'Temp',
  '2010 mix',
  'Hindi Songs',
  'Top of the world song',
  '!R',
];

class PlayListScreen extends StatefulWidget {
  final void Function(int index) updateIndex;
  const PlayListScreen(this.updateIndex, {super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  late ScrollController _scrollController;
  bool isVisible = true;
  late FocusNode _focusNode;
  bool _changeOpacity = true;
  final ValueNotifier<double> _notifier = ValueNotifier(320);
  final ValueNotifier<bool> _notifier2 = ValueNotifier(true);
  final ValueNotifier<double> _imageWidthNotifier = ValueNotifier(200);
  final ValueNotifier<double> _imageOpacityNotifier = ValueNotifier(1);
  final ValueNotifier<double> _appbarOpacityNotifier = ValueNotifier(0);
  final ValueNotifier<double> _searchOpacityNotifer = ValueNotifier(1);

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _scrollController = ScrollController(initialScrollOffset: 90)
      ..addListener(() {
        // print(_scrollController.offset);
        if (!isVisible && _scrollController.offset < 400) {
          _scrollController.jumpTo(400);
        }

        if (_changeOpacity) {
          _appbarOpacityNotifier.value =
              ((_scrollController.offset - 250) * 0.03).clamp(0, 1);
        }

        _searchOpacityNotifer.value =
            ((50 - _scrollController.offset) * 0.05).clamp(0, 1);

        _imageWidthNotifier.value =
            (290 - _scrollController.offset).clamp(100, 200);

        _imageOpacityNotifier.value =
            ((224 - _scrollController.offset) * 0.03).clamp(0, 1);

        _notifier.value = (410 - _scrollController.offset).clamp(30, 410);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _notifier.dispose();
    _notifier2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(alignment: Alignment.topCenter, children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                height: 455,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: _searchOpacityNotifer,
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                        onTap: () {
                                          Future.delayed(
                                              const Duration(seconds: 0), () {
                                            _notifier2.value = false;
                                            _changeOpacity = false;
                                          }).then((value) => _scrollController
                                                  .animateTo(400,
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease)
                                                  .whenComplete(() {
                                                setState(() {
                                                  isVisible = false;
                                                  _focusNode.requestFocus();
                                                });
                                              }));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                CupertinoIcons.search,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Find in Playlist',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 0.5,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                      const SizedBox(width: 10),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Text(
                                          'Sort',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        const SizedBox(height: 25),
                        Center(
                          child: ValueListenableBuilder(
                              valueListenable: _imageOpacityNotifier,
                              builder: (context, value, ch) {
                                return Opacity(
                                  opacity: value,
                                  child: ValueListenableBuilder(
                                      valueListenable: _imageWidthNotifier,
                                      builder: (context, value, child) {
                                        return Material(
                                          elevation: 10,
                                          child: Image.asset(
                                            'assets/images/thumbnail 1.jpg',
                                            width: value,
                                          ),
                                        );
                                      }),
                                );
                              }),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '2000\'s Mix',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.3),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Abhay',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: 0.3),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Icon(
                              Icons.timer_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '3h 27min',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  letterSpacing: 0.3),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Chip(
                              label: Text(
                                '✨',
                                style: TextStyle(color: Colors.grey),
                              ),
                              backgroundColor: Colors.black,
                              side: BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.downloading_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.person_add_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                            Expanded(child: Container()),
                            const Icon(
                              Icons.shuffle_outlined,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 60,
                              height: 40,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ])),
            const SliverPadding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              sliver: SliverToBoxAdapter(
                child: Chip(
                  labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                  side: BorderSide(width: 0.5, color: Colors.grey),
                  label: Text('Add songs'),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 10,
                    (context, index) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/thumbnail ${index + 1}.jpg'))),
                  height: 45,
                  width: 40,
                ),
                tileColor: Colors.black,
                title: Text(
                  _playlist[index],
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  'playlist',
                  style: TextStyle(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.only(left: 12),
                trailing: IconButton(
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              );
            })),
            const SliverToBoxAdapter(
              child: SizedBox(height: 140),
            )
          ],
        ),
        SizedBox(
          height: 55,
          // preferredSize: const Size.fromHeight(55),
          child: ValueListenableBuilder(
              valueListenable: _appbarOpacityNotifier,
              builder: (context, value, child) {
                return AppBar(
                  centerTitle: !isVisible ? true : false,
                  title: !isVisible
                      ? SizedBox(
                          width: 200,
                          child: Container(
                            height: 33,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              cursorColor: Colors.greenAccent.shade700,
                              focusNode: _focusNode,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: Icon(
                                    CupertinoIcons.search,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Find in playlist',
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      letterSpacing: 0.3)),
                            ),
                          ))
                      : Opacity(
                          opacity: value, child: const Text('2000\'s Mix')),
                  backgroundColor: !isVisible
                      ? Colors.red.shade800
                      : Colors.red.shade800.withOpacity(value),
                  elevation: 0,
                  leading: IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    icon: const Icon(CupertinoIcons.arrow_left),
                    onPressed: () {
                      if (isVisible) {
                        widget.updateIndex(0);
                      }
                      setState(() {
                        _notifier2.value = true;
                        isVisible = true;
                        _changeOpacity = true;
                        _scrollController.animateTo(90,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);
                      });
                    },
                  ),
                );
              }),
        ),
        ValueListenableBuilder(
            valueListenable: _notifier2,
            builder: (context, value2, child2) {
              return ValueListenableBuilder(
                  valueListenable: _notifier,
                  builder: (context, value, child) {
                    return value2
                        ? Positioned(
                            top: value,
                            right: 10,
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.greenAccent.shade700,
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                          )
                        : Container();
                  });
            }),
      ]),
    );
  }
}
