import 'package:flutter/material.dart';
import 'package:random_tools/view/base/base_app_bar.dart';
import 'package:random_tools/view/base/base_footer.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.body,
  });

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const BaseAppBar(),
      body: ListView(
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: size.height - kToolbarHeight),
            child: body ?? const SizedBox.shrink(),
          ),
          const BaseFooter(),
        ],
      ),
    );
  }
}
