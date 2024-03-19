import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';
import 'package:random_tools/view/base/base_scafflod.dart';
import 'package:random_tools/view_modle/lot_page_view_model.dart';

class LotPage extends StatefulWidget {
  const LotPage({super.key});

  @override
  State<LotPage> createState() => _LotPageState();
}

class _LotPageState extends State<LotPage> {
  final _fortuneController = StreamController<int>();
  final _labelsTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _labelsTextController.text = context.read<LotPageViewModel>().labelsText;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BaseScaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<LotPageViewModel>(
            builder: (context, value, child) => Stack(
              children: [
                IconButton.filledTonal(
                  onPressed: () => _fortuneController.add(
                    Fortune.randomInt(0, value.labels.length),
                  ),
                  tooltip: "抽籤",
                  icon: SizedBox.square(
                    dimension: min(size.width, size.height) * 0.6,
                    child: FortuneWheel(
                      selected: _fortuneController.stream,
                      items: value.labels
                          .map((e) => FortuneItem(
                              child: Text(e,
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ))))
                          .toList(),
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
                              "調整籤筒內容",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _labelsTextController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 6,
                                validator: (text) => value.updateLabels(text?.trim() ?? ""),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("取消"),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _labelsTextController.text = value.labelsText;
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text("確定"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    tooltip: "調整籤筒內容",
                    icon: const Icon(Icons.settings),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
