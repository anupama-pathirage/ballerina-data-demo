import ballerina/io;
import ballerinax/java.jdbc;

// JDBC Client for MySQL database. This client can be used with any JDBC
// supported database by providing the corresponding JDBC URL.
// jdbc:Client testDB = new ({
//    url: "jdbc:mysql://localhost:3306/demodb",
//    username: "root",
//    password: "password",
//    dbOptions: {useSSL: false}
// });

// JDBC Client for H2 database.
jdbc:Client testDB = new ({
    url: "jdbc:h2:file:./db_files/demodb",
    username: "test",
    password: "test"
});

type Customer record {
    int id;
    string name;
    int age;
};


public function main() {
    // Create the table.
    var ret = testDB->update("CREATE TABLE CUSTOMER (ID INTEGER, NAME VARCHAR(30), AGE INTEGER)");
    handleUpdate(ret, "Create CUSTOMER table");

    // Insert data row to the table
    ret = testDB->update("INSERT INTO CUSTOMER (ID, NAME, AGE) VALUES (1, 'Alex', 30)");
    handleUpdate(ret, "Insert data to CUSTOMER table");

    // Update data row in the table
    ret = testDB->update("UPDATE CUSTOMER SET name = 'Alexi' WHERE ID = ?", 1);
    handleUpdate(ret, "Update data in CUSTOMER table");

    // Retrieving data from table.
    var selectRet = testDB->select("SELECT * FROM CUSTOMER WHERE age < ?", Customer, 35);
    if (selectRet is table<Customer>) {
        foreach var row in selectRet {
            io:println(row);
        }
    }
}

// Function to handle the return value of the `update` remote function.
function handleUpdate(jdbc:UpdateResult|error returned, string message) {
    if (returned is jdbc:UpdateResult) {
        io:println(message + " status: ", returned.updatedRowCount);
    } else {
        io:println(message + " failed: ", <string>returned.detail()?.message);
    }
}