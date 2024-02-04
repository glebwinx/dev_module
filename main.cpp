#include <iostream>
#include "src/sqlite3.h"
using namespace std;

int main()
{
    sqlite3* db;
    int rc;
    rc = sqlite3_open("Test.db", &db);
    if (rc != SQLITE_OK)
        cout << "file is not open" << endl;
    else
        cout << "file open" << endl;
    return 0;
}