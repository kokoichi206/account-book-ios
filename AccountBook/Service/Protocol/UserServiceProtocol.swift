//
//  UserServiceProtocol.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/17.
//

import Foundation

protocol UserServiceProtocol {

    func createUser(request: CreateUserRequest, completion: @escaping(CreateUserResponse) -> Void)

    func loginUser(request: LoginUserRequest, completion: @escaping(CreateUserResponse) -> Void)
}
