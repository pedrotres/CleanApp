//
//  Model.swift
//  Domain
//
//  Created by pedro tres on 05/08/22.
//

import Foundation

public protocol Model: Codable, Equatable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
