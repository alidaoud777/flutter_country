import 'package:auto_route/auto_route.dart';
import 'package:flutter_country_app/core/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/',
          page: CountryRoute.page,
          initial: true,
        ),
        //////////////
        CustomRoute(
          path: '/country_detail',
          page: CountryDetailRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 100,
        ),
      ];
}
