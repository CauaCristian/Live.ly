import 'package:mysql1/src/single_connection.dart';

import 'mysql_db_configuration.dart';

class DBConnection extends MySqlDBconfiguration {
  @override
  Future<MySqlConnection> createConnection() {
    return super.createConnection();
  }
}