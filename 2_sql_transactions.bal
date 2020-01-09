import ballerina/io;
import ballerinax/java.jdbc;

jdbc:Client testDB = new ({
    url: "jdbc:h2:file:./db_files/demodb2",
    username: "test",
    password: "test",
    poolOptions: { maximumPoolSize: 5 }
});

public function main() {
    // Create the tables that are required for the transaction.
    var ret = testDB->update("CREATE TABLE CUSTOMER (ID INTEGER, NAME VARCHAR(30))");
    handleUpdate(ret, "Create CUSTOMER table");    
    
    ret = testDB->update("CREATE TABLE SALARY (ID INTEGER, MON_SALARY FLOAT)");
    handleUpdate(ret, "Create SALARY table");

    // This is a `transaction` block. If you do not explicitly `abort` or
    // `retry` a returned error, the transaction will be automatically
    // retried until the retry count is reached and aborted.
    transaction with retries = 4 {
        ret = testDB->update("INSERT INTO CUSTOMER(ID,NAME) VALUES (1, 'Anne')");
        ret = testDB->update("INSERT INTO SALARY (ID, MON_SALARY) VALUES (1, 2500)");

        if (ret is jdbc:UpdateResult) {
            io:println("Inserted count: ", ret.updatedRowCount);
            // If the transaction is forced to abort, it will roll back the transaction
            // and exit the transaction block without retrying.
            if (ret.updatedRowCount == 0) {
                abort;
            }
        } else {
            // If the transaction is forced to retry, it will roll back the transaction,
            // go to the `onretry` block, and retry from the beginning until the defined
            // retry count is reached.
            retry;
        }
    } onretry {
        io:println("Retrying transaction");
    } committed {
        io:println("Transaction committed");
    } aborted {
        io:println("Transaction aborted");
    }
}
function handleUpdate(jdbc:UpdateResult|error returned, string message) {
    if (returned is jdbc:UpdateResult) {
        io:println(message + " status: ", returned.updatedRowCount);
    } else {
        io:println(message + " failed: ", returned.reason());
    }
}
