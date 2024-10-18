// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter_country_app/features/country/presentation/pages/country_details_page.dart'
    as _i1;
import 'package:flutter_country_app/features/country/presentation/pages/country_page.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CountryDetailRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CountryDetailPage(),
      );
    },
    CountryRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CountryPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CountryDetailPage]
class CountryDetailRoute extends _i3.PageRouteInfo<void> {
  const CountryDetailRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CountryDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CountryDetailRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CountryPage]
class CountryRoute extends _i3.PageRouteInfo<void> {
  const CountryRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CountryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CountryRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
