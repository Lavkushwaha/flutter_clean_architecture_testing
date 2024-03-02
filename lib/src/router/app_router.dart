import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_placeholder_tdd2/src/di/di.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
import 'package:json_placeholder_tdd2/src/features/domain/repository/user_repository.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/page/user_detail_page.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/page/user_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: UserRoute.page, initial: true),
        AutoRoute(page: UserDetailsRoute.page, guards: []),
      ];
}
