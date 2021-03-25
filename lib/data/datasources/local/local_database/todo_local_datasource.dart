import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/base_local_database.dart';

class TodoLocalDatasource extends BaseLocalDataSource {
  TodoLocalDatasource();

  @override
  Future<List> getFormattedData() {
    // TODO: implement getFormattedData
    throw UnimplementedError();
  }
}
