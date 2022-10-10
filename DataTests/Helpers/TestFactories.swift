//
//  TestFactories.swift
//  DataTests
//
//  Created by pedro tres on 15/09/22.
//

import Foundation

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeValidData() -> Data {
    return Data("{\"name\":\"Pedro\"}".utf8)
}

func makeUrl () -> URL {
    return URL(string: "http://any-url.com")!
}
