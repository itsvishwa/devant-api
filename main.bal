import ballerina/http;
import ballerina/log;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function get getCharData/[string id]() returns json|error {
        do {
            json res = check rickMortyClient->get("character/" + id);
            string characterName = check res.name;
            log:printInfo(characterName);

            if res.status == "Alive" {
                return {"message": "The character is alive!"};
            } else {
                return {"message": "The character is not alive."};
            }

        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}
