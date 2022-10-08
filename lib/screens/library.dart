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

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const PageStorageKey('library'),
      slivers: [
        SliverAppBar(
          key: const PageStorageKey('save'),
          elevation: 20,
          floating: true,
          pinned: false,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
              key: const PageStorageKey('save'),
              titlePadding: EdgeInsets.zero,
              title: Container(
                color: Colors.black,
                height: 60,
                child: ListView(
                  key: const PageStorageKey('chip'),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(width: 10),
                    Chip(
                      label: Text('Playlist'),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: Colors.black,
                      side: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Chip(
                      label: Text('Artists'),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: Colors.black,
                      side: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Chip(
                      label: Text('Albums'),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: Colors.black,
                      side: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Chip(
                      label: Text('Podcasts & Shows'),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: Colors.black,
                      side: BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              )),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Most Recent',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(
                  Icons.grid_view,
                  size: 20,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate(childCount: 10, (context, index) {
            return ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/thumbnail ${index + 1}.jpg'))),
                height: 60,
                width: 50,
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
          }),
        ),
        SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 10, (context, index) {
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/thumbnail ${index + 1}.jpg'))),
              height: 60,
              width: 50,
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
    );
  }
}
