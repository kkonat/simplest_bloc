// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const appName = "Simplest Bloc app";

class Counter {
  final int value;
  const Counter(this.value);
}

class AppState extends Cubit<Counter> {
  AppState([super.initialState = const Counter(0)]);
  setCounter(v) => emit(Counter(v));
  modCounter(d) => emit(Counter(state.value + d as int));
  get counterValue => state.value;
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  build(context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text(appName)),
          body: BlocProvider(
              create: (_) => AppState(),
              child: BlocBuilder<AppState, Counter>(builder: (ctx, _) {
                return buildPage(ctx.read());
              }))));

  buildPage(AppState c) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${c.counterValue}",
              textScaleFactor: 3.0,
            ),
            ButtonBar(alignment: MainAxisAlignment.center, children: [
              button(Icons.add, () => c.modCounter(1)),
              button(Icons.clear, () => c.setCounter(0)),
              button(Icons.remove, () => c.modCounter(-1)),
            ])
          ],
        ),
      );

  static button(icon, func) => FloatingActionButton(
        onPressed: func,
        child: Icon(icon),
      );
}

void main() {
  runApp(const App());
}
