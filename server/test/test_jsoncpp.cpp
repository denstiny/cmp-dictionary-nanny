#include <string>
#include <iostream>
#include "json//json.h"

int main (int argc, char* argv[]) {
  std::string str =
    "{\"filter\": \"hello world\", \"table_name\": \"stardict\", \"correlation_id\": 14, \"max_num_results\": 20}";
  Json::Reader reader;
  Json::Value root;
  if (reader.parse (str, root, true)) {
    std::cout << "filter " << root["filter"].asString() << std::endl;
    std::cout << "table_name" << root["table_name"].asString() <<
              std::endl;
    std::cout << "correlation_id " << root["correlation_id"].asInt() <<
              std::endl;
    std::cout << "max_num_results " << root["max_num_results"].asInt() <<
              std::endl;
  } else {
    std::cout << "Parse error" << std::endl;
  }
  return 0;
}
