import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

List<String> _search = [
  'Podcasts',
  'Made For You',
  'New releases',
  'Hindi',
  'Punjabi',
  'Charts',
  'Trending',
  'Live Events',
  'Romance',
  'Pop'
];

class SearchScreen extends StatelessWidget {
  final List<Color> _colorsRandom;
  const SearchScreen(this._colorsRandom, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey('search'),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Text(
              'Search',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
        ),
        SliverPinnedHeader(
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.72,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.search,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Artist, songs, or podcasts',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                IconButton(
                    splashRadius: 25,
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.mic,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Browse all',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          sliver: SliverGrid(
              key: const PageStorageKey('search'),
              delegate:
                  SliverChildBuilderDelegate(childCount: 10, (context, index) {
                return Stack(
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: _colorsRandom[index],
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Positioned(
                      right: -15,
                      child: Transform.rotate(
                        angle: -50,
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 3,
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/thumbnail ${index + 1}.jpg'))),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Text(
                        _search[index],
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                );
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15)),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 120),
        )
      ],
    );
  }
}
