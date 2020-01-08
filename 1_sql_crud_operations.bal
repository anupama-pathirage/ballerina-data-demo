import ballerina/io;
import ballerinax/java.jdbc;

// JDBC Client for MySQL database. This client can be used with any JDBC
// supported database by providing the corresponding JDBC URL.
//jdbc:Client testDB = new ({
//    url: "jdbc:mysql://localhost:3306/demodb",
//    username: "test",
//    password: "test",
//    dbOptions: {useSSL: false}
//});

// JDBC Client for H2 database.
jdbc:Client testDB = new ({
    url: "jdbc:h2:file:./db_files/demodb",
    username: "test",
    password: "test"
});

public function main() {
    // Create the tables that are required for the transaction.
    var ret = testDB->update("CREATE TABLE CUSTOMER (ID INTEGER, NAME VARCHAR(30), AGE INTEGER)");
    handleUpdate(ret, "Create CUSTOMER table");
}

// Function to handle the return value of the `update` remote function.
function handleUpdate(jdbc:UpdateResult|error returned, string message) {
    if (returned is jdbc:UpdateResult) {
        io:println(message + " status: ", returned.updatedRowCount);
    } else {
        io:println(message + " failed: ", <string>returned.detail()?.message);
    }
}