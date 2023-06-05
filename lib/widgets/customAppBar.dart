import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/core/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../data/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(Constants.appName),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () => {
                AutoRouter.of(context).push(const UserProfileRoute())},
                icon: const Icon(Icons.person)
            )
        )
      ],
    );
  }
}