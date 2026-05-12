import ballerina/http;

final http:Client rickMortyClient = check new ("https://rickandmortyapi.com/api/");
