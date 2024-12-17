import 'package:dnd_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatWidgetsState extends StateNotifier<List<(String, Widget)>> {
  StatWidgetsState() : super(const []);

  void addWidget(Widget widget) {
    state = [...state, (MyApp.uuid.v1(), widget)];
  }

  void clear() {
    state = [];
  }
}

final statWidgetsProvider =
    StateNotifierProvider<StatWidgetsState, List<(String, Widget)>>((ref) {
  return StatWidgetsState();
});
