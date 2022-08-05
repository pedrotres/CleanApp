//
//  Model.swift
//  Domain
//
//  Created by pedro tres on 05/08/22.
//

import Foundation

protocol Model: Encodable {}

extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
