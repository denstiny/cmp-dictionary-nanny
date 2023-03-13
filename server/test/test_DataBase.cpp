#include "../database.hpp"
int main() {

  TableData* table_data = new TableData();
  table_data->table_name = "stardict";
  table_data->correlation_id = 0;
  table_data->filter = "a";
  DataBases database;
  char db_path[MAXLEN];
  GetSqliteDbPath (db_path);
  database.OpenSqlite (db_path);
  database.TableQuery (table_data);
}
