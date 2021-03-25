import 'package:kiwi/kiwi.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static final T Function<T>([String name]) resolve = container.resolve;
}
