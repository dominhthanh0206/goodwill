import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goodwill/gen/assets.gen.dart';
import 'package:goodwill/gen/colors.gen.dart';
import 'package:goodwill/source/common/extensions/build_context_ext.dart';
import 'package:goodwill/source/common/widgets/circle_avatar/circle_avatar.dart';
import 'package:goodwill/source/data/model/user_profile.dart';
import 'package:goodwill/source/routes.dart';
import 'package:goodwill/source/service/auth_service.dart';
import 'package:goodwill/source/service/user_profile_service.dart';
import 'package:goodwill/source/ui/page/profile/widgets/edit_profile_widgets/bottom_sheet_logout.dart';
import 'package:goodwill/source/util/constant.dart';
import 'package:goodwill/source/util/file_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> profileScreenData = {
      'Profile': [
        {
          "title": context.localizations.editProfile,
          "iconUrl": Assets.svgs.user.path
        },
        {
          "title": context.localizations.notification,
          "iconUrl": 'assets/svgs/icon_bell.svg'
        },
        {
          "title": context.localizations.purchaseHistory,
          "iconUrl": Assets.svgs.eye.path
        },
        {
          "title": context.localizations.payment,
          "iconUrl": Assets.svgs.creditCard.path
        },
        {
          "title": context.localizations.security,
          "iconUrl": Assets.svgs.shieldCheck.path
        },
        {
          "title": context.localizations.language,
          "iconUrl": Assets.svgs.language.path
        },
        {
          "title": context.localizations.helpCenter,
          "iconUrl": 'assets/svgs/information_circle.svg'
        },
        {
          "title": context.localizations.inviteFriends,
          "iconUrl": Assets.svgs.users.path
        },
      ]
    };
    Theme expansionTileCustom(int type, List keys, BuildContext context) {
      List maps = profileScreenData[keys[type]];
      return Theme(
        data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Colors.white,
            ),
            dividerColor: Colors.transparent),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: maps.length,
          itemBuilder: (context, index) {
            final item = maps[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: InkWell(
                onTap: () {
                  _onTap(context, item);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(maps[index]['iconUrl']),
                        const SizedBox(width: 8),
                        Text(
                          maps[index]['title'],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 7, 3, 3),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    final userProfile = context.watch<UserProfile?>();
    String _fullName = userProfile?.fullName ?? Constant.UNKNOWN;
    String _userProfilePicture =
        userProfile?.profilePicture ?? Assets.images.homePage.person.path;
    String _phoneNumber = userProfile?.phoneNumber ?? Constant.FAKE_PHONENUMBER;

    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(
          backgroundColor: ColorName.white,
          elevation: 0.0,
          leading: Assets.svgs.mainIcon.svg(),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Assets.svgs.moreCircle.svg(color: Colors.black),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Avatar(
                        imagePath: _userProfilePicture,
                        size: const Size(120, 120),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -25,
                        child: RawMaterialButton(
                          elevation: 2.0,
                          fillColor: const Color(0xFFF5F6F9),
                          padding: const EdgeInsets.all(16.0),
                          shape: const CircleBorder(),
                          onPressed: () {
                            FileHelper.browseSingleImage(
                                handleFile:
                                    UserProfileService.updateProfilePicture);
                          },
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    // 'Vien Tran Quang Minh',
                    _fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  // '0844444444',
                  _phoneNumber,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.grey.shade700),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: profileScreenData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        expansionTileCustom(
                            index, profileScreenData.keys.toList(), context),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0)),
                                ),
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return BottomSheetLogout(
                                    text: context.localizations.logOut,
                                    content: Text(context.localizations
                                        .areYouSureYouWantToLogout),
                                    buttonText1: context.localizations.cancel,
                                    buttonText2: context.localizations.logOut,
                                    function1: (() {
                                      log('cancel');
                                      context.pop();
                                    }),
                                    function2: (() {
                                      log('Logout');
                                      context.pop();
                                      AuthService.signOut();
                                    }),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Assets.svgs.logout.svg(),
                                const SizedBox(width: 8),
                                Text(
                                  context.localizations.logOut,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onTap(BuildContext context, item) {
  if (item['title'] == context.localizations.editProfile) {
    return context.pushNamed(Routes.editProfile);
  } else if (item['title'] == context.localizations.notification) {
    return context.pushNamed(Routes.notification);
  } else if (item['title'] == context.localizations.purchaseHistory) {
    return context.pushNamed(Routes.purchaseHistory);
  } else if (item['title'] == context.localizations.payment) {
    print('payment');
  } else if (item['title'] == context.localizations.security) {
    return context.pushNamed(Routes.security);
  } else if (item['title'] == context.localizations.language) {
    return context.pushNamed(Routes.changeLanguage);
  } else if (item['title'] == context.localizations.helpCenter) {
    print('Help Center');
  } else if (item['title'] == context.localizations.inviteFriends) {
    print('Invite Friends');
  } else {
    // Handle the default case here
  }
}
