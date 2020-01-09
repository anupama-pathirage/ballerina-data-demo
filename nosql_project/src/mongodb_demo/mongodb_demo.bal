import ballerina/io;
import wso2/mongodb;

public function main() {
    mongodb:ClientEndpointConfig config = {
        host: "localhost",
        dbName: "demo"
    };

    mongodb:Client mongoClient = checkpanic new (config);

    /////////////////////////// Insert documents ///////////////////////////
    map<json> doc1 = {
        "name": "MongoDB",
        "type": "database",
        "count": 1,
        "versions": ["v3.2", "v3.0", "v2.6"],
        "info": {x: 203, y: 102}
    };

    map<json> doc2 = {
        "name": "MongoDB",
        "type": "database",
        "count": 2,
        "versions": ["v3.2", "v3.0", "v2.6"],
        "info": {x: 203, y: 102}
    };

    map<json> doc3 = {
        "name": "Other",
        "type": "database"
    };

    insertDoc(mongoClient, "test", doc1);
    insertDoc(mongoClient, "test", doc2);
    insertDoc(mongoClient, "test", doc3);

    /////////////////////////// findOne() for no query string ///////////////////////////
    json findOneRes = mongoClient->findOne("test", ());

    io:println("\nfindOne() for no query string: ", findOneRes.toJsonString());

    /////////////////////////// find() for no query string ///////////////////////////
    json[] findRes = mongoClient->find("test", ());

    io:println("\nfind() for no query string: ");
    foreach [int, json] [index, item] in findRes.enumerate() {
        io:println(index, " --> ", item.toJsonString());
    }

    /////////////////////////// findOne() with query string `{name: \"Other\"}` ///////////////////////////
    json findOneWithQueryRes = mongoClient->findOne("test", {name: "Other"});

    io:println("\nfindOne() with query string `{name: \"Other\"}`: ", findOneWithQueryRes.toJsonString());

    /////////////////////////// find() with query string `{name: \"MongoDB\"}` ///////////////////////////
    json[] findWithQueryRes = mongoClient->find("test", {name: "MongoDB"});

    io:println("\nfind() with query string `{name: \"MongoDB\"}`: ");
    foreach [int, json] [index, item] in findWithQueryRes.enumerate() {
        io:println(index, " --> ", item.toJsonString());
    }

    /////////////////////////// delete() ///////////////////////////
    int deleteCount = mongoClient->delete("test", {name: "MongoDB"}, true);
    io:println("\ndelete() count for filter `{name: \"MongoDB\"}`: ", deleteCount);

    findRes = mongoClient->find("test", ());

    io:println("\nfind() for no query string after deletion: ");
    foreach [int, json] [index, item] in findRes.enumerate() {
        io:println(index, " --> ", item.toJsonString());
    }

    mongoClient.stop();
}

function insertDoc(mongodb:Client mongoClient, string collection, map<json> doc) {
    error? res = mongoClient->insert("test", doc);
    if res is error {
        mongoClient.stop();
        panic res;
    }
}
