import 'package:flutter/material.dart';

import '../../../domain/model/image_model.dart';

class DetailScreen extends StatelessWidget {
  final Images image;

  const DetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상세 이미지'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image.imageUrl,
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(height: 24, thickness: 1),
            const SizedBox(height: 24),
            Text(
              '업로더: ${image.user}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Divider(height: 24, thickness: 1),
            const SizedBox(height: 12),
            const Text(
              ' 관련 태그',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Divider(height: 24, thickness: 1),
            Wrap(
              spacing: 8,
              children:
                  image.tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor: Colors.deepPurple.shade50,
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
