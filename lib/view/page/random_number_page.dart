import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_tools/view/base/base_scafflod.dart';
import 'package:random_tools/view_modle/random_number_view_model.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key});

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  final _upperTextController = TextEditingController();
  final _lowerTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _upperTextController.text =
        context.read<RandomNumberViewModel>().upperLimit.toString();
    _lowerTextController.text =
        context.read<RandomNumberViewModel>().lowerLimit.toString();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BaseScaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<RandomNumberViewModel>(builder: (context, value, child) {
            return Stack(
              children: [
                IconButton.filledTonal(
                  onPressed: () => value.nextRandom(),
                  icon: SizedBox.square(
                    dimension: min(size.width, size.height) * 0.6,
                    child: Center(
                      child: Text(
                        value.result,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton.filled(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "變更亂數範圍",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: _lowerTextController,
                                  decoration:
                                      const InputDecoration(labelText: "最小值"),
                                ),
                                TextFormField(
                                  controller: _upperTextController,
                                  decoration:
                                      const InputDecoration(labelText: "最大值"),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("取消"),
                              ),
                              TextButton(
                                onPressed: () {
                                  value.setLimit(
                                    lower: _lowerTextController.text,
                                    upper: _upperTextController.text,
                                  );
                                  Navigator.of(context).pop();
                                },
                                child: const Text("確定"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    tooltip: value.limitLabel,
                    icon: const Icon(Icons.settings),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
