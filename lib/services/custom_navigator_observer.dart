import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _breadcrumbGen(route, 'push');
  }

  @override
  didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _breadcrumbGen(newRoute, 'replace');
  }

  @override
  didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _breadcrumbGen(route, 'pop');
  }

  @override
  didRemove(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _breadcrumbGen(route, 'remove');
  }

  _breadcrumbGen(Route<dynamic>? route, String? category) {
    if (route == null) return;

    print([
      route.settings.name ?? 'unknown',
      category ?? 'no-category',
    ]);

    Sentry.configureScope((scope) {
      scope.addBreadcrumb(Breadcrumb(
        message: route.settings.name,
        // data: {"arguments": (route.settings.arguments as Map).keys.toList()},
        timestamp: DateTime.now(),
        category: category,
      ));
    });
  }
}
