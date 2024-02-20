import 'package:streaming/model/db_configuration.dart';
import 'package:mysql1/mysql1.dart';

class MySqlDBconfiguration implements DBConfiguration {
  MySqlConnection? _connection;
  @override
  Future<MySqlConnection?> get connection async {
    if (_connection == null) _connection = await createConnection();
    return _connection;
  }

  @override
  Future<MySqlConnection> createConnection() async {
    return await MySqlConnection.connect(
      ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        password: null,
        db: 'live_ly',
      ),
    );
  }
}
