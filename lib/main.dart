import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: Text('Bloc Course')),
        body: Center(child: Text('Hello World')),
      ),
    );
  }
}

// The `Person` class you've written is a Dart class with a custom `==` operator and `hashCode` implementation.
//   * These are **immutable fields** (because of `final`), which means once a `Person` object is created, its `name` and `age` cannot be changed.

class Person {
  final String name;
  final int age;

  //   * You're using a `const` constructor, which allows you to create **compile-time constant objects**, as long as the arguments are also constants.
  //   * `required` keyword makes sure the caller must pass values for `name` and `age`.
  const Person({required this.name, required this.age});

  // This overrides the default behavior of the `==` operator, which normally checks if two references point to the same object in memory.
  // * Checks if both variables point to the exact same object in memory (i.e., same reference).
  // * If they do, return `true`.
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Person &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            age == other.age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
