import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_tools/extension/responosive_extension.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      titleSpacing: breakpoint.sidePadding,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FontAwesomeIcons.toolbox,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    "隨機",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Text(
                    "工具",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      leading: breakpoint.isMobile
          ? IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            )
          : null,

      // 手機介面標題置中
      centerTitle: breakpoint.isMobile,

      // 手機不顯示 nav options
      actions: breakpoint.largerThan(MOBILE)
          ? [
              TextButton(
                onPressed: () {},
                child: const Text("亂數"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("抽籤"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("排序"),
              ),
              SizedBox(width: breakpoint.sidePadding),
            ]
          : [const SizedBox()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
