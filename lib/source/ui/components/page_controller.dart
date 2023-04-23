import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:goodwill/source/common/extensions/build_context_ext.dart';
import 'package:goodwill/source/service/user_profile_service.dart';
import 'package:goodwill/source/ui/page/home/home_page.dart';
import 'package:goodwill/source/ui/page/manage_post.dart';
import 'package:goodwill/source/ui/page/post.dart';
import 'package:goodwill/source/ui/page/profile/profile_page.dart';
import 'package:provider/provider.dart';

import '../../data/model/user_profile.dart';

class MyPageController extends StatefulWidget {
  const MyPageController({super.key});

  @override
  State<MyPageController> createState() => _MyPageControllerState();
}

class _MyPageControllerState extends State<MyPageController> {
  int _selectedIndex = 0;
  Color? selectedColor = Colors.black;
  late Future<UserProfile?> _userProfileFuture;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = [
    HomePage(),
    ManagePost(),
    Post(),
    ProfilePage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    _userProfileFuture = UserProfileService.getMyUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<UserProfile?>.value(
      value: _userProfileFuture,
      initialData: null,
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              label: context.localizations.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article_outlined),
              label: context.localizations.managePosts,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.post_add),
              label: context.localizations.post,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: context.localizations.person,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: selectedColor,
          onTap: _onItemTapped,
        ),
      ).animate().fadeIn(duration: const Duration(milliseconds: 400)),
    );
  }
}
