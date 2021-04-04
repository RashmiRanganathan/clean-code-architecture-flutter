import 'package:clean_code_architecture_flutter/common/utils/database_util.dart';
import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/base_local_database.dart';

import '../../../../common/utils/__mock__/sample_adapter.dart';
import '../../../../common/utils/__mock__/sample_table.dart';
import 'sample_model.dart';

class ExtendedLocalDataSource
    extends BaseLocalDataSource<SampleTable, SampleModel> {
  ExtendedLocalDataSource() : super(boxName: 'testBox') {
    DatabaseUtil.registerAdapter<SampleTable>(SampleTableAdapter());
  }

  @override
  Future<List<SampleModel>> getFormattedData() async {
    return null;
  }

  @override
  Future<void> insertOrUpdateAll(List<SampleModel> contacts) async {}
}
