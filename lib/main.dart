import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const appName = "Simplest Bloc app";

class Counter {
  final int value;
  const Counter(this.value);
}

class State extends Cubit<Counter> {
  State([super.initialState = const Counter(0)]);
  setCounter(v) => emit(Counter(v));
  addCounter(d) => emit(Counter(state.value + d as int));
  count() => state.value;
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  build(context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text(appName)),
          body: BlocProvider(
              create: (_) => State(),
              child: BlocBuilder<State, Counter>(
                  builder: (c_, s_) => const Page()))));
}

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  build(context) {
    var c = context.read<State>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${c.count()}",
            textScaleFactor: 3.0,
          ),
          ButtonBar(alignment: MainAxisAlignment.center, children: [
            button(Icons.add, () => c.addCounter(1)),
            button(Icons.clear, () => c.setCounter(0)),
            button(Icons.remove, () => c.addCounter(-1)),
          ])
        ],
      ),
    );
  }

  static button(icon, func) => FloatingActionButton(
        onPressed: func,
        child: Icon(icon),
      );
}

void main() {
  runApp(const App());
}
