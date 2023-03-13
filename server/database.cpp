#include "database.hpp"


DataBases::DataBases() {}

DataBases::~DataBases() {
  sqlite3_close (db);
}

DataBases::DataBases (char* db_path) {
  this->OpenSqlite (db_path);
}

bool DataBases::OpenSqlite (char* db_path) {
  int rc = sqlite3_open (db_path, &this->db);
  if ( rc ) {
    std::cerr << "Can't open database: " << sqlite3_errmsg (
                db) << std::endl;
    return false;
  } else {
    return true;
  }
}

bool DataBases::TableQuery (TableData* table_data) {
  const std::string table_name = table_data->table_name;
  const std::string filter = table_data->filter;
  char* errmsg = new char (0);
  char* sql = new char[MAXLEN];
  snprintf (sql, MAXLEN,
            "SELECT * FROM %s WHERE word LIKE '%s%%' LIMIT 0,1000",
            table_name.c_str(), filter.c_str());
            
  int rc = sqlite3_exec (db,
                         sql,
                         callback,
                         static_cast<void*> (table_data),
                         &errmsg);
                         
  if ( rc != SQLITE_OK ) {
    std::cerr << "SQL error: " << errmsg << std::endl;
    sqlite3_free (errmsg);
  } else {
    table_data->resue.Show();
  }
  delete[] sql;
  delete table_data;
  return true;
}

const char* GetHomePath() {
  return getenv ("HOME");
}

void GetSqliteDbPath (char* path) {
  snprintf (path, MAXLEN, "%s/.local/share/nvim/data/ultimate.db",
            GetHomePath());
}

void Resue::AddData (Json::Value value) {
  root["results"].append (value);
}

void Resue::SetCorrelationId (int value) {
  root["correlation_id"] = value;
}

void Resue::Show() {

  //std::string correlation_id_str = "correlation_id = \"";
  //correlation_id_str.append (table_data->correlation_id);
  //correlation_id_str.append ("\"");
  //table.append (correlation_id_str);
  //std::cout << "[" << resue_string << "]" << std::endl;
  //std::cout << "count :"  << this->count << std::endl;
  Json::StreamWriterBuilder jswBuilder;
  jswBuilder["emitUTF8"] = true;
  jswBuilder["indentation"] = "";
  std::unique_ptr<Json::StreamWriter>jsWriter (
    jswBuilder.newStreamWriter());
  std::ostringstream os;
  jsWriter->write (root, &os);
  std::cout << os.str() << std::endl;
}

void Resue::Clear() {}

Resue::Resue() {
  this->count = 0;
}

TableData::TableData (std::string from_data) {
  Json::CharReaderBuilder builder;
  const std::unique_ptr<Json::CharReader> reader (
    builder.newCharReader());
  Json::Value root;
  std::string err;
  if (reader->parse (from_data.c_str(),
                     from_data.c_str() + from_data.size(), &root,
                     &err)) {
    this->table_name =  root["table_name"].asString();
    this->filter = root["filter"].asString();
    this->correlation_id = root["correlation_id"].asInt();
    this->resue.SetCorrelationId (this->correlation_id);
  }
}
