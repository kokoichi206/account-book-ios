//
//  User.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/21.
//

import Foundation

// ユーザー。
struct User: Codable {
    var id: Int
    var username: String
    var email: String
    var age: Int32?
    var balance: Int64?
}
