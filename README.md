# clean-code-architecture-flutter

Seed app with clean code architecture

In clean code architecture, there are three main layers

- Data
- Domain
- Presentation
  along with
- common (can also be called as core)

![image](https://user-images.githubusercontent.com/25193983/112195232-b8665d80-8c2f-11eb-83cb-e362b8bff420.png)

## Common

This contains all the common functionalities for the application.
e.g http client, env config, platform specific stuffs like network checker, etc.

These common functionalities will be used by data layer, domain layer and presentation layer
e.g http client by remote data source, network info by repository layer, enums by
domain layer and config by presentation.

## Domain

This is innermost layer and will contain the core business logic i.e. usecases and business object also called as entities, the usecase depends on the contract of repository (not implementation)

## Data

The data layers contains the repository implementation and this layer is closest to actual data sources and is responsible for communication with data sources.

The data layer returns the models and not entities and the model also contains the fromJson and toJson mapper.

Note: We don’t have an extra mapper class, we are just going to leverage the named constructor by dart to map our data set from one form to our models. toJson and fromJson.

## Presentation

This layer contains all the information about the UI and everything to show to the end user customer. The presentation layer also contains the bloc which is the state management and often termed as brain of UI.

The presentation layer interact via domain layer, i.e entities and use cases.

# Folder structure

```
├── lib
│   ├── common
│   │   ├── configs
│   │   │   └── configuration.dart
│   │   ├── constants
│   │   │   ├── exception_constants.dart
│   │   │   ├── http_constants.dart
│   │   │   ├── local_database_type_constants.dart
│   │   │   └── route_constants.dart
│   │   ├── exceptions
│   │   │   ├── bad_request_exception.dart
│   │   │   ├── forbidden_exception.dart
│   │   │   ├── server_error_exception.dart
│   │   │   ├── server_exception.dart
│   │   │   └── unauthorized_exception.dart
│   │   ├── extensions
│   │   │   └── string_extension.dart
│   │   ├── http
│   │   │   └── http_client.dart
│   │   ├── injector
│   │   │   ├── injector_config.dart
│   │   │   └── injector_config.g.dart
│   │   └── utils
│   │       ├── database_util.dart
│   │       ├── http_utils.dart
│   │       └── json_utils.dart
│   ├── data
│   │   ├── datasources
│   │   │   ├── local
│   │   │   │   ├── local_database
│   │   │   │   │   ├── base_local_database.dart
│   │   │   │   │   ├── tables
│   │   │   │   │   │   ├── todo_table.dart
│   │   │   │   │   │   └── todo_table.g.dart
│   │   │   │   │   └── todo_local_datasource.dart
│   │   │   │   └── shared_preference
│   │   │   └── remote
│   │   │       └── todo_remote_datasource.dart
│   │   ├── models
│   │   │   └── todo_model.dart
│   │   └── repositories
│   │       └── todo_repository_impl.dart
│   ├── domain
│   │   ├── entities
│   │   │   └── todo_entity.dart
│   │   ├── repositories
│   │   │   └── todo_repository.dart
│   │   └── usescases
│   │       └── todo_usecase.dart
│   ├── main.dart
│   └── presentation
│       ├── app.dart
│       ├── journey
│       │   ├── dashboard
│       │   │   ├── dashboard_routes.dart
│       │   │   └── dashboard_screen.dart
│       │   └── todo
│       │       ├── bloc
│       │       │   ├── todo_bloc.dart
│       │       │   ├── todo_event.dart
│       │       │   └── todo_state.dart
│       │       ├── create_todo
│       │       │   └── create_todo_screen.dart
│       │       ├── todo_list
│       │       │   ├── todo_list_screen.dart
│       │       │   └── widgets
│       │       │       └── todo_item.dart
│       │       └── todo_routes.dart
│       ├── routes.dart
│       └── themes
│           ├── custom_icons.dart
│           ├── theme_colors.dart
│           ├── theme_data.dart
│           └── theme_text.dart
├── pubspec.lock
└── pubspec.yaml

```

# How to run

`flutter run`

In case of addition to injector file,
run `flutter pub run build_runner build --delete-conflicting-outputs`
