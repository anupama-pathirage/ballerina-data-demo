 # SQL/NoSQL Storage
 
 This repo contains the prerequisites and demo scripts for a demo on SQL/NoSQL storage in Ballerina.
 
 ## Session Slides
 
 
 
 ## Prerequisites
 
 * Install Ballerina 1.1.0
 * Install an IDE Plugin for Ballerina (e.g., [VSCode Ballerina Plugin](https://marketplace.visualstudio.com/items?itemName=ballerina.ballerina) or [IntelliJ IDEA plugin](https://plugins.jetbrains.com/plugin/9520-ballerina))

 * Prerequisites for the relational database samples - H2 or MySQL DB
    * H2 - No installation required since a file-based DB is used. The H2 JDBC driver is already shipped with the Ballerina distribution. 

    * MySQL (Optional) 
        * Install MySQL DB on your local machine or use an existing DB server.
        * Create a database named `demodb` using a DB Client.
        * Copy the MySQL JDBC driver to the `<ballerina-home>/bre/lib` folder on your the local machine. 
          
          Note: You can find the `<ballerina-home>` location using the  following command
            ```cmd
            $ ballerina home
            ```
    * Install a DB Visualizer tool (Optional)

 * Prerequisites for the NoSQL database samples
    * [Install MongoDB Community Edition](https://docs.mongodb.com/manual/installation/#mongodb-community-edition-installation-tutorials)
    
    * Install a DB Visualizer tool (Optional) - e.g., [MongoDB Compass Community Edition](https://www.mongodb.com/download-center/compass)

