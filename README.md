# simplest Flutter Bloc app

The simplets Flutter app with Bloc.

Tried to come up with the simplest and the most readable flutter bloc application.
Actually, it's not Bloc, but Cubit, which is even simpler.

Tried to rearrange the app so as to isolate the three parts:
a) state management is separated
b) gui rendering
c) flutter / bloc boilerplate (the ugliest)

I've found that the code is the most readable,
if you set the following options in VS Code:

- Dart: Preview Flutter Ui Guides [x]
- Dart: Closing Labels [ ]
