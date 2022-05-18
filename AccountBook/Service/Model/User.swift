//
//  User.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/18.
//

import Foundation

// ユーザー新規作成の Request Body
struct CreateUserRequest: Codable {
    var username: String
    var password: String
    var email: String
    var age: Int32
    var balance: Int64
}

// ユーザー新規作成の Response Body
struct CreateUserResponse: Codable {
    var id: Int
    var username: String
    var email: String
    var age: Int
    var balance: Int
    // 通信時はStringで受ける
    var password_changed_at: String
    var created_at: String
}

// ログインの Request Body
struct LoginUserRequest: Codable {
    var password: String
    var email: String
}
