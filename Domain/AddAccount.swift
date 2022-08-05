//
//  AddAccount.swift
//  Domain
//
//  Created by pedro tres on 01/08/22.
//

import Foundation

protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void)
}

struct AddAccountModel: Encodable {
    let name: String
    let email: String
    let password: String
    let passwordConfirmation: String
}
