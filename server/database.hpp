#pragma once
#include <sqlite3.h>
#include "jsoncpp/include/json.h"
#include <iostream>
#include <sstream>
#include <cstring>
#define MAXLEN 100
const static char* home = getenv ("HOME");

class Resue {
  public:
    Resue();
    void AddData (std::string table);
    void Show();
    void Clear ();
  private:
    std::string resue_string;
    long long count;
};

class TableData {
  public:
    TableData() {};
    TableData (std::string from_data);
    std::string table_name;
    std::string filter;
    std::string correlation_id;
    Resue resue;
};

class DataBases {
  public:
    DataBases (char* db_path);
    DataBases();
    ~DataBases();
    bool TableQuery (TableData* table_data);
    bool OpenSqlite (char* path);
  private:
    sqlite3* db;
};

const char* GetHomePath();

void GetSqliteDbPath (char* path);


static int callback (void* _table_data, int argc, char** argv,
                     char** azColName) {
  int i;
  TableData* table_data = static_cast<TableData*> (_table_data);
  /*  Create a field correlation_id */
  std::string correlation_id_str = "correlation_id = \"";
  correlation_id_str.append (table_data->correlation_id);
  correlation_id_str.append ("\"");
  
  std::string table = "{";
  for (i = 0; i < argc; i++) {
    table.append (azColName[i]);
    table.append ("=\"");
    table.append (argv[i] ? (strlen (argv[i]) == 0 ? "NULL" : argv[i]) :
                  "NULL");
    table.append ("\"");
    table.append ((i + 1 != argc ? "," :  " "));
    table.append ("\n");
  }
  table.append (correlation_id_str);
  table.append ("},\n");
  table_data->resue.AddData (table);
  return 0;
}
