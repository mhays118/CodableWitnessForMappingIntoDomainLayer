import Domain
import Coding
import Foundation

extension Address {
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case zipCode = "zip"
    }
}

extension Decoding where Value == Address {
    static var street: Decoding<String> = Decoding<String>
        .withKey(Address.CodingKeys.street)

    static var city: Decoding<String> = Decoding<String>
        .withKey(Address.CodingKeys.city)

    static var state: Decoding<String> = Decoding<String>
        .withKey(Address.CodingKeys.state)

    static var zipCode: Decoding<Int> = Decoding<String>
        .withKey(Address.CodingKeys.zipCode)
        .map(Int.init)
        .replaceNil(with: 0)

    static var standard: Decoding<Address> {
        zip(with: Address.init)(street, city, state, zipCode)
    }
}
