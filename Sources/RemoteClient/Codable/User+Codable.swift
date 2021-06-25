import Domain
import Coding
import Foundation

// MARK: - Decoding Strategies

extension Decoding where Value == User {
    /// Standard way of decoding a user
    static let compressed = zip(id, name).map { User.init(id: $0, name: $1) }
    static let standard = zip(id, name, address).map(User.init)
}

// MARK: Coding Keys

extension User {
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case address
    }
}

// MARK: - Decoding Properties

extension Decoding where Value == User {
    static var id: Decoding<String> = Decoding<String>
        .withKey(User.CodingKeys.id)

    static var name: Decoding<PersonNameComponents> {
        // Maps json with `first_name` and `last_name` properties into a ``PersonNameComponents`` object for ``Domain/User``
        .init { decoder in
            let container = try decoder.container(keyedBy: User.CodingKeys.self)
            let firstName = try container.decode(String.self, forKey: .firstName)
            let lastName = try container.decode(String.self, forKey: .lastName)

            var nameComponents = PersonNameComponents()
            nameComponents.givenName = firstName
            nameComponents.familyName = lastName
            return nameComponents
        }
    }

    // ⚠️ This does NOT work
    // It will try pulling all the properties on Address directly on to `User` instead of having
    // a nested object.
    //
    // Also cannot do `.withKey(User.CodingKeys.address)` afterwards,
    // as `address does NOT conform to `Decodable`
    static var address: Decoding<Address> = .standard
}
