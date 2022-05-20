//
//  LoginViewModel.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/18.
//

import Foundation

class AuthViewModel: ObservableObject {

    @Published var didAuthenticateUser = false

    private var service: UserServiceProtocol

    init(service: UserServiceProtocol = UserService()) {
        self.service = service
    }

    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
    }

    func register(withEmail email: String, password: String, fullname: String, username: String) {
        print("DEBUG: Register with email \(email)")
    }
}
