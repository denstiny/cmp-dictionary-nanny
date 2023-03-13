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
    void SetCorrelationId (int);
    void AddData (Json::Value value);
    void Show();
    void Clear ();
  private:
    //std::string resue_string;
    Json::Value root;
    long long count;
};

class TableData {
  public:
    TableData() {};
    TableData (std::string from_data);
    std::string table_name;
    std::string filter;
    std::string field;
    int correlation_id;
    int max_results;
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
  Json::Value node;
  for (i = 0; i < argc; i++) {
    node[azColName[i]] = argv[i] ? (strlen (argv[i]) == 0 ? "NULL" :
                                    argv[i]) : "NULL";
  }
  table_data->resue.AddData (node);
  return 0;
}
