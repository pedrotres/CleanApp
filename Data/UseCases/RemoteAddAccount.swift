//
//  RemoteAddAccount.swift
//  Data
//
//  Created by pedro tres on 05/08/22.
//

import Foundation
import Domain

final class RemoteAddAccount: AddAccount {
    private let url: URL
    private let httpClient: HttpPostClient
    
    init(url: URL, httpClient: HttpPostClient){
        self.url = url
        self.httpClient = httpClient
    }
    
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void) {
        httpClient.post(to: url, with: addAccountModel.toData()) { result in
            switch result {
            case .success(let data):
                if let model: AccountModel = data.toModel() {
                    completion(.success(model))
                }
            case .failure:
                completion(.failure(.unexpected))
            }
        }
    }
}
