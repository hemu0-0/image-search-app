import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/router/router.dart';
import 'package:image_search_app/presentation/main/search_image/search_image_view_model.dart';

import '../../data/data_source/image_data_source_impl.dart';
import '../../data/repository/image_repository_impl.dart';
import '../../domain/model/image_model.dart';
import '../../domain/use_case/image_use_case.dart';
import '../../presentation/main/detail_screen/detail_screen.dart';
import '../../presentation/main/home/home.dart';
import '../../presentation/main/home/home_tab.dart';
import '../../presentation/main/profile/profile.dart';
import '../../presentation/main/search_image/search_image.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    // Detail 화면은 ShellRoute 밖에 위치
    GoRoute(
      path: Routes.detail,
      builder: (context, state) {
        final image = state.extra as Images;
        return DetailScreen(image: image);
      },
    ),

    // 탭 구조 ShellRoute
    ShellRoute(
      builder: (context, state, child) {
        return HomeTab(child: child);
      },
      routes: [
        GoRoute(path: Routes.home, builder: (context, state) => Home()),
        GoRoute(
          path: Routes.search,
          builder:
              (context, state) => SearchScreen(
                SearchViewModel(
                  SearchImageUseCase(
                    ImageRepositoryImpl(ImageDataSourceImpl()),
                  ),
                ),
              ),
        ),
        GoRoute(
          path: Routes.profile,
          builder: (context, state) => const Profile(),
        ),
      ],
    ),
  ],
);
