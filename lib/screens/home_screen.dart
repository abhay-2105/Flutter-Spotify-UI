import 'package:flutter/material.dart';

final List<String> _playlist = [
  '2010 mix',
  'Hindi Songs',
  'Top of the world song',
  '!R',
  'Hindi Lofi',
  'Temp'
];

class HomeScreen extends StatefulWidget {
  final void Function(int index) updateIndex;
  const HomeScreen(this.updateIndex, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey('home'),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            // color: Colors.black,
            padding: const EdgeInsets.only(right: 15, top: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Good evening',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.grey.shade900,
                      splashRadius: 20,
                      icon: const Icon(Icons.notifications_outlined,
                          size: 26, color: Colors.white),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      padding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.grey.shade900,
                      splashRadius: 20,
                      icon: const Icon(Icons.more_time_sharp,
                          size: 26, color: Colors.white),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      padding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.grey.shade900,
                      splashRadius: 20,
                      icon: const Icon(Icons.settings_outlined,
                          size: 26, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SliverPadding(
          padding:
              const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 6,
              (context, index) {
                return InkWell(
                  onTap: () {
                    widget.updateIndex(3);
                  },
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade900,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      Image.asset(index != 3
                          ? 'assets/images/thumbnail ${index + 1}.jpg'
                          : 'assets/images/thumbnail ${10}.jpg'),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: 35,
                          child: Text(
                            _playlist[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Text('Jump back in',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 170,
            child: ListView.builder(
              key: const PageStorageKey('jump'),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/thumbnail ${index + 4}.jpg'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: 110,
                        child: Text(
                          _playlist[index],
                          style: const TextStyle(
                              letterSpacing: 0.4,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'playlist',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Text('Recently Played',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.4,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 170,
            child: ListView.builder(
              key: const PageStorageKey('recent'),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/thumbnail ${index + 1}.jpg'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: 110,
                        child: Text(
                          _playlist[index],
                          style: const TextStyle(
                              letterSpacing: 0.4,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'playlist',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Text('Recommended for today',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 190,
            child: ListView.builder(
              key: const PageStorageKey('today'),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/thumbnail ${index + 5}.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: 110,
                        child: Text(
                          _playlist[index],
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Album',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 120),
        )
      ],
    );
  }
}
