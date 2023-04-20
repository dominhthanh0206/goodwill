import 'package:flutter/material.dart';
import 'package:goodwill/source/ui/components/page_controller.dart';
import 'package:goodwill/source/ui/page/chat/chat_screen.dart';
import 'package:goodwill/source/ui/page/post.dart';
import 'package:goodwill/source/ui/page/product/category_page.dart';
import 'package:goodwill/source/ui/page/product/product_details_page.dart';
import 'package:goodwill/source/ui/page/profile.dart';
import 'package:goodwill/source/ui/page/sign_in/fill_profile.dart';
import 'package:goodwill/source/ui/page/sign_in/sign_in.dart';
import 'package:goodwill/source/ui/page/sign_in/sign_up.dart';
import 'package:goodwill/source/ui/start_app.dart';
import 'package:goodwill/source/ui/page/chat/room_chat_screen.dart';


class Routes {
  static const startApp = '/';
  static const signIn = '/sign_in';
  static const signUp = '/sign_Up';
  static const fillProfile = '/fillProfile';
  static const myPageController = '/pageController';
  static const post = '/post';
  static const profile = '/profile';
  static const category = '/category';
  static const productDetails = '/product-details';
  static const chatScreen = '/chat-screen';
  static const roomChatScreen = '/room-chat';
}

var customRoutes = <String, WidgetBuilder>{
  Routes.signIn: (context) => const SignInScreen(),
  Routes.signUp: (context) => const SignUpScreen(),
  Routes.fillProfile: (context) => const FillProfileScreen(),
  Routes.post: (context) => const Post(),
  Routes.profile: (context) => const Profile(),
  Routes.startApp: (context) => const StartApp(),
  Routes.myPageController: (context) => const MyPageController(),
  Routes.category: (context) => const CategoryPage(),
  Routes.productDetails: (context) => const ProductDetailsPage(),
  Routes.roomChatScreen: (context) => const RoomChatScreen(),
  Routes.chatScreen: (context) => const ChatScreen()
};
