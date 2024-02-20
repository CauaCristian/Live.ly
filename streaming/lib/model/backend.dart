import 'mysql_db_configuration.dart';

void main() async {
  var connection = await MySqlDBconfiguration().connection;
  var result = await connection!.query('select * from usuarios;');
  print(result);
}
