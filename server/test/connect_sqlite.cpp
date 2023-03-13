#include <sqlite3.h>
#include <cstring>
#include <unistd.h>
#include <iostream>
const static char* home = getenv ("HOME");
static int callback (void* data, int argc, char** argv,
                     char** azColName) {
  int i;
  fprintf (stderr, "%s: ", (const char*)data);
  for (i = 0; i < argc; i++) {
    printf ("%s = %s\n", azColName[i],
            argv[i] ? (strlen (argv[i]) == 0 ? "NULL" : argv[i])  : "NULL");
  }
  printf ("\n");
  return 0;
}

int main (int argc, char* argv[]) {
  char* errmsg = 0;
  const char* data = "Callback function called";
  sqlite3* db;
  char* zErrMsg = 0;
  int rc;
  char sqlite_db_path[50];
  snprintf (sqlite_db_path, 50, "%s/.local/share/nvim/data/ultimate.db",
            home);
  rc = sqlite3_open (sqlite_db_path, &db);
  if ( rc ) {
    fprintf (stderr, "Can't open database: %s\n", sqlite3_errmsg (db));
    return 0;
  } else {
    fprintf (stdout, "Opened database successfully\n");
  }
  rc = sqlite3_exec (db,
                     "SELECT  * FROM stardict WHERE word LIKE 'string'", callback,
                     (void*)data, &errmsg);
  if ( rc != SQLITE_OK ) {
    fprintf (stderr, "SQL error: %s\n", errmsg);
    sqlite3_free (errmsg);
  } else {
    fprintf (stdout, "Operation done successfully\n");
  }
  sqlite3_close (db);
}
