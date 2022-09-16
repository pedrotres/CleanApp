//
//  AccountModelFactory.swift
//  Data
//
//  Created by pedro tres on 15/09/22.
//

import Domain
import Foundation

func makeAccountModel() -> AccountModel {
    return AccountModel(
        id: "any_id",
        name: "any_name",
        email: "any_email@mail.com",
        password: "any_password",
        passwordConfirmation: "any_password"
    )
}
