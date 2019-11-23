import 'package:flutter/widgets.dart';

class FrailtyRoute extends PageRoute<void> {
  FrailtyRoute({
    @required this.builder,
    RouteSettings settings,
  })
      : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);

    return FadeTransition(
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ), opacity: Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animation),
    );
  }
}

class EmptyRoute extends PageRoute<void> {
  EmptyRoute({
    @required this.builder,
    RouteSettings settings,
  })
      : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);

    return result;
  }
}