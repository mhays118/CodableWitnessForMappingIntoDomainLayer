# CodableWitnessForMappingIntoDomainLayer

Example Project for using Codable Witnesses to separate JSON encoding/decoding from domain layer.

Two modules exist: `Domain` and `RemoteClient`.

`Domain` should know nothing about json or servers and only have the core models for the given project. `RemoteClient` should depend on `Domain` and provide mappings to and from the remote server api.
