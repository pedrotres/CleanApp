//
//  AddAccount.swift
//  Domain
//
//  Created by pedro tres on 01/08/22.
//

import Foundation

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void)
}

public struct AddAccountModel: Model {
    
    let name: String
    let email: String
    let password: String
    let passwordConfirmation: String
    
    public init(name: String, email: String, password: String, passwordConfirmation: String) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
