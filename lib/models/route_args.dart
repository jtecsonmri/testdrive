import 'package:flutter/foundation.dart';
class RouteArgs{
  RouteArgs(
    this.uri, 
    this.matchedLocation, 
    this.name, 
    this.path, 
    this.fullPath, 
    this.pathParameters, 
    this.extra,
    this.pageKey,
    this.error
    );

  final Uri uri;

  final String matchedLocation;

  final String? name;

  final String? path;

  final String? fullPath;

  final Map<String, String> pathParameters;

  final Object? extra;

  final ValueKey<String> pageKey;

  final String? error;
}