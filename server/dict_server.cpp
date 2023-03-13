/**
  @author      : aero (2254228017@qq.com)
  @file        : dict_server
  @created     : 星期五 3月 10, 2023 22:03:53 CST
  @github      : https://github.com/denstiny
  @blog        : https://denstiny.github.io
*/
#include "database.hpp"
#include "dict_server.hpp"

int main (int argc, char** argv) {
  DataBases database;
  char db_path[MAXLEN];
  if (argc == 1) {
    GetSqliteDbPath (db_path);
    database.OpenSqlite (db_path);
  } else {
    database.OpenSqlite (argv[1]);
  }
  std::string str;
  
  while (std::getline (std::cin, str)) {
    TableData* table_data = new TableData (str);
    std::future<bool> task =  std::async (&DataBases::TableQuery,
                                          &database,
                                          table_data
                                         );
    task.get();
  }
  return 0;
}
