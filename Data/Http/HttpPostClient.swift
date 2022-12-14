//
//  HttpPostClient.swift
//  Data
//
//  Created by pedro tres on 05/08/22.
//

import Foundation

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data, HttpError>) -> Void)
}
