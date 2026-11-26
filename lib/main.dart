// Lab L1 starter: this is the counter app that `flutter create lab01_profile`
// generates (Step 2). Run it, tap + a few times, then commit and push it:
//   git commit -m "Create Flutter starter app"
//
// TODO(Step 3): Delete EVERYTHING in this file and type the Step 3 code
//   yourself: `void main() => runApp(const MaterialApp(home: HomePage()));`
//   and a `HomePage extends StatelessWidget` whose build() returns
//   `const Scaffold(body: Center(child: Text('Hello!')))`.
//   Press R (hot restart). Commit: "Replace counter with HomePage".
//   Also delete test/widget_test.dart (it tests this counter, which is gone).
// TODO(Step 4): Replace the return in HomePage.build with a Scaffold that has
//   `appBar: AppBar(title: const Text('Lab L1 · [ID]'))` (YOUR student ID) and a `const Center` with a
//   Column (mainAxisSize: MainAxisSize.min) of `Icon(Icons.person, size: 96)`
//   and `Text('[Your name] - [ID]')` with YOUR real name and student ID.
//   Save (hot reload). Commit: "Add profile layout".
// TODO(Step 5): Turn HomePage into a StatefulWidget plus a
//   `_HomePageState extends State<HomePage>` that holds `int _likes = 0;`.
//   Move the Step 4 return into _HomePageState.build(). Press R.
// TODO(Step 6): In _HomePageState add `void _like() => setState(() => _likes++);`
//   Delete `const` before Center, then add `Text('Likes: $_likes')` and
//   `FilledButton(onPressed: _like, child: const Text('Like'))` to the Column.
//   Commit: git commit -am "Add like counter with setState"
// TODO(Step 7): Tap Like 3 times, change 'Lab L1' to 'Lab L1 done', press r,
//   then R. Write what happened to Likes in answers.md, then commit
//   "Add L1 answers" and push.

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _likes = 0;

  void _like() => setState(() => _likes++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab L1 done · 67122663')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, size: 96),
            const Text('Sutthiwong Thipmak - 67122663'),
            Text('Likes: $_likes'),
            FilledButton(onPressed: _like, child: const Text('Like')),
          ],
        ),
      ),
    );
  }
}