 # SQL/NoSQL Storage
 
 This repo contains the prerequisites and demo scripts for a demo on SQL/NoSQL storage in Ballerina.
 
 ## Prerequisites
 
 * [Install Ballerina 1.1.0](https://ballerina.io/downloads/)
 * Install an IDE Plugin for Ballerina (e.g., [VSCode Ballerina Plugin](https://marketplace.visualstudio.com/items?itemName=ballerina.ballerina) or [IntelliJ IDEA plugin](https://plugins.jetbrains.com/plugin/9520-ballerina))

 * Prerequisites for the relational database samples - H2 or MySQL DB
    * H2 - No installation required since a file-based DB is used. The H2 JDBC driver is already shipped with the Ballerina distribution. 

    * MySQL (Optional) 
        * [Install MySQL DB](https://dev.mysql.com/downloads/mysql/) on your local machine or use an existing DB server.
        * Create a database named `demodb` using a DB Client.
        
        * Copy the [MySQL JDBC driver] (https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.48/mysql-connector-java-5.1.48.jar) to the `<ballerina-home>/bre/lib` directory on your local machine. 
          
          Note: You can find the `<ballerina-home>` location using the  following command:
            ```cmd
            $ ballerina home
            ```
    * Install a DB Visualizer tool (Optional) - Ex: [DBVisualizer] (https://www.dbvis.com/)

 * Prerequisites for the NoSQL database samples
    * [Install MongoDB Community Edition](https://docs.mongodb.com/manual/installation/#mongodb-community-edition-installation-tutorials)

    * Install a DB Visualizer tool (Optional) - e.g., [MongoDB Compass Community Edition](https://www.mongodb.com/download-center/compass)


## Examples

Refer following examples for more details.

* [JDBC Client CRUD Operations](https://ballerina.io/v1-1/learn/by-example/jdbc-client-crud-operations.html)
* [JDBC Client Batch Update](https://ballerina.io/v1-1/learn/by-example/jdbc-client-batch-update.html)
* [JDBC Client Call Procedures](https://ballerina.io/v1-1/learn/by-example/jdbc-client-call-procedures.html)
* [Streaming a Big Dataset](https://ballerina.io/v1-1/learn/by-example/jdbc-streaming-big-dataset.html)
* [Local Transactions](https://ballerina.io/v1-1/learn/by-example/local-transactions.html)
* [XA Transactions](https://ballerina.io/v1-1/learn/by-example/xa-transactions.html)