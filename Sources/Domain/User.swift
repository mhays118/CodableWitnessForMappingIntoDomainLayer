import Foundation

public struct User: Equatable {
    public let id: String
    public let name: PersonNameComponents
    public let address: Address?

    public init(
        id: String,
        name: PersonNameComponents,
        address: Address? = nil
    ) {
        self.id = id
        self.name = name
        self.address = address
    }
}
