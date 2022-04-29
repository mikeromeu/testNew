// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let results: [Result]
//    let info: Info
}

// MARK: - Info
//struct Info: Codable {
//    let seed: String
//    let results, page: Int
//    let version: String
//}

// MARK: - Result
struct Result: Codable {
//    let gender: String
    let name: Name
    let location: Location
//    let email: String
//    let login: Login
//    let dob, registered: Dob
//    let phone, cell: String
//    let id: ID
    let picture: Picture
//    let nat: String
}

//// MARK: - Dob
//struct Dob: Codable {
//    let date: String
//    let age: Int
//}

//// MARK: - ID
//struct ID: Codable {
//    let name, value: String
//}

// MARK: - Location
struct Location: Codable {
//    let street, city, state, postcode: String
    let coordinates: Coordinates
//    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}

//// MARK: - Timezone
//struct Timezone: Codable {
//    let offset, timezoneDescription: String
//
//    enum CodingKeys: String, CodingKey {
//        case offset
//        case timezoneDescription = "description"
//    }
//}

//// MARK: - Login
//struct Login: Codable {
//    let uuid, username, password, salt: String
//    let md5, sha1, sha256: String
//}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable {
//    let large, medium : String
    let thumbnail: String
}

// MARK: - Place
//struct Place {
//    let latitude: Float?
//    let longitude: Float?
//}
