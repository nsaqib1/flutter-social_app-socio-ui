import 'package:flutter/material.dart';
import 'package:flutter_social_app_ui/data/data.dart';
import 'package:flutter_social_app_ui/widgets/following_users.dart';
import 'package:flutter_social_app_ui/widgets/my_drawer.dart';

import '../widgets/posts_caraosel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );
  late final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SOCIO',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Text('Trending'),
            Text('Latest'),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const FollwingUsers(),
          PostsCaraosel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
