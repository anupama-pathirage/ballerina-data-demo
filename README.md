 # SQL/NoSQL Storage
 
 This repo contains the prerequisites and demo scripts for SQL/NoSQL Storage session.
 
 ## Session Slides
 
 
 
 ## Pre-Requisites
 
 * Install Ballerina 1.1.0
 * Install IDE Plugin for Ballerina (ex : VSCode Ballerina Plugin)
 * SQL Database  - Samples can be tried with H2 or MySQL DB. 
   * H2 - No need to install anything as we are using file based DB. H2 JDBC driver is already shipped with Ballerina distribution. 
   * MySQL 
        * Install MySQL DB in your local machine or use existing DB server.
        * Create a database named `demodb` using a DB Client.
        * Copy the MySQL JDBC driver to `<ballerina-home>/bre/lib` folder of the local machine. 
          Note: You can find the <ballerina-home> location by issuing the following command  
 ```ballerina home```
 * Install DB Visualizer tool (Optional)
 * NoSQL Database 
    * Install MongoDB

