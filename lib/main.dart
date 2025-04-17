import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/main/home/home.dart';
import 'package:image_search_app/presentation/main/search_image/search_image.dart';
import 'package:image_search_app/presentation/main/search_image/search_image_view_model.dart';

import 'core/router/routes.dart';
import 'data/data_source/image_data_source_impl.dart';
import 'data/repository/image_repository_impl.dart';
import 'domain/model/image_model.dart';
import 'domain/use_case/image_use_case.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Image app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
