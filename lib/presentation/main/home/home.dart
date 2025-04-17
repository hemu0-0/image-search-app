import 'package:flutter/material.dart';

import '../../component/nvbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '아직 준비 되지 않았어요',
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
