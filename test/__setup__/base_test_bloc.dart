import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:meta/meta.dart';

class BaseBlocTest<B extends Bloc<E, S>, E, S> {
  BaseBlocTest();
  void test(String description,
      {B Function() build,
      Future<void> Function(B bloc) act,
      Duration wait,
      Future<void> Function() verify,
      @required Iterable expect}) {
    return blocTest<B, E, S>(
      description,
      build: build,
      wait: wait,
      verify: verify,
      act: act,
      expect: expect,
    );
  }
}
