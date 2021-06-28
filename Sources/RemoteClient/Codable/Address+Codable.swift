import Domain
import Coding
import Foundation

// MARK: - Decoding Strategies
extension Address {
    static var standard = zip(with: Address.init)(street, city, state, zipCode)
}

// MARK: Coding Keys

extension Address {
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case zipCode = "zip"
    }
}

// MARK: - Decoding Properties

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

}
