import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const appName = "Simplest Bloc app";
void main() {
  runApp(const App());
}

class AppState extends Cubit<int> {
  AppState(super.initialState);

  set state(val) {
    emit(val);
  }
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  build(context) => MaterialApp(
      title: appName,
      home: Scaffold(
          body: BlocProvider(
              create: (_) => AppState(0),
              child: BlocBuilder<AppState, int>(
                builder: (ctx, _) =>
                    pageContent(BlocProvider.of<AppState>(context)),
              ))));

  pageContent(AppState c) => Center(
        child: Column(
          children: [
            Text("The state is now: ${c.state}"),
            button(Icons.add, () => c.state++),
            button(Icons.clear, () => c.state = 0),
            button(Icons.remove, () => c.state--),
          ],
        ),
      );

  button(icon, func) => ElevatedButton(
        onPressed: func,
        child: Icon(icon),
      );
}
