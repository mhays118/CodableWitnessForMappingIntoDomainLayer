import Foundation
import Coding
import Domain
@testable import RemoteClient
import XCTest

let userJson = """
{
    "id": "1234",
    "first_name": "John",
    "last_name": "Smith",
    "address": {
        "street": "123 W Main Street",
        "city": "New York",
        "state": "NY",
        "zip": "11111"
    },
    "twitter_handle": "jsmith123"
}
""".data(using: .utf8)!

final class UserDecodingTests: XCTestCase {
    func test_user_decodes_standard_successfully() throws {
        let decoder = JSONDecoder()
        let user: User = try decoder.decode(userJson, as: .standard)

        var name = PersonNameComponents()
        name.givenName = "John"
        name.familyName = "Smith"

        let address = Address(street: "123 W Main Street", city: "New York", state: "NY", zipCode: 11111)

        XCTAssertEqual(user, User(id: "1234", name: name, address: address))
    }

    func test_user_decodes_compressed_successfully() throws {
        let decoder = JSONDecoder()
        let user: User = try decoder.decode(userJson, as: .compressed)
        var name = PersonNameComponents()
        name.givenName = "John"
        name.familyName = "Smith"

        XCTAssertEqual(user, User(id: "1234", name: name, address: nil))
    }
}
