import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app/presentation/main/search_image/search_image_view_model.dart';
import '../../../core/router/router.dart';

class SearchScreen extends StatelessWidget {
  final SearchViewModel _viewModel;

  SearchScreen(this._viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 45),
                  child: TextField(
                    key: const Key('search_field'),
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: '이미지 검색어 입력',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () => _viewModel.search(controller.text),
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),

        Expanded(
          child: AnimatedBuilder(
            animation: _viewModel,
            builder: (context, _) {
              if (_viewModel.state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _viewModel.state.images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final image = _viewModel.state.images[index];

                  return GestureDetector(
                    onTap: () {
                      context.push(Routes.detail, extra: image);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            image.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(image.user, style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
