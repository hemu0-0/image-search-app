import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/presentation/component/nvbar.dart';

import '../../../core/router/router.dart';

class HomeTab extends StatelessWidget {
  final Widget child;

  const HomeTab({super.key, required this.child});

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.home)) return 0;
    if (location.startsWith(Routes.search)) return 1;
    if (location.startsWith(Routes.profile)) return 2;
    return 0; // fallback
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _getSelectedIndex(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(['Home', 'Search', 'Profile'][selectedIndex]),
        centerTitle: true,
      ),
      body: child,
      bottomNavigationBar: NVBar(
        index: selectedIndex,
        onTap: (index) => context.go(_routes[index]),
      ),
    );
  }

  List<String> get _routes => [Routes.home, Routes.search, Routes.profile];
}
