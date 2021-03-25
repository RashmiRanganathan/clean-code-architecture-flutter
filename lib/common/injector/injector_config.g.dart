// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => TodoBloc(todousecase: c<Todousecase>()));
  }

  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => Todousecase(todoRespository: c<TodoRespository>()));
  }

  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TodoRespository>((c) => TodoRespositoryImpl(
        todoRemoteDatasource: c<TodoRemoteDatasource>(),
        todoLocalDatasource: c<TodoLocalDatasource>()));
  }

  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton(
        (c) => TodoRemoteDatasource(httpClient: c<HttpClient>()));
  }

  void _configureLocalDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => TodoLocalDatasource());
  }

  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => HttpClient(
        host: c<String>('https://api-nodejs-todolist.herokuapp.com/')));
  }
}
