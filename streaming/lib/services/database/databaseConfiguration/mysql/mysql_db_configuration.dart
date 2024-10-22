import 'package:mysql1/mysql1.dart';
import '../db_configuration.dart';

class MySqlDBconfiguration implements DBConfiguration {
  MySqlConnection? _connection;
  @override
  Future<MySqlConnection?> get connection async {
    _connection ??= await createConnection();
    return _connection;
  }

  @override
  Future<MySqlConnection> createConnection() async {
    return await MySqlConnection.connect(
      ConnectionSettings(
        host: 'monorail.proxy.rlwy.net',
        port: 37418,
        user: 'root',
        password: '6a2d5gaeaF3gE4fdbh35cBHAA1616Fd4',
        db: 'railway',
      ),
    );
  }
}
