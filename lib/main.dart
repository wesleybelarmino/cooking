import 'package:flutter/material.dart';
import 'features/recipe/presentation/pages/recipe_list_page.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

const PrimaryColor = const Color(0xFFFC7E63);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking',
      theme: ThemeData(primaryColor: PrimaryColor),
      home: RecipeListPage(),
    );
  }
}
