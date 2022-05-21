//
//  LoginViewModel.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/18.
//

import Foundation

class AuthViewModel: ObservableObject {

    @Published var didAuthenticateUser = false
    @Published var user: User?

    private var service: UserServiceProtocol

    init(service: UserServiceProtocol = UserService()) {
        self.service = service
    }

    func login(withEmail email: String, password: String) {
        print("DEBUG: Login with email \(email)")
        let request = LoginUserRequest(password: password, email: email)
        service.loginUser(request: request) { response in
            self.user = User(id: response.id,
                             username: response.username,
                             email: response.email,
                             age: response.age,
                             balance: response.balance
            )
        }
    }

    func register(withEmail email: String, password: String, username: String,
                  age: String, balance: String) {
        print("DEBUG: Register with email \(email)")

        let request = CreateUserRequest(
            username: username,
            password: password,
            email: email,
            age: Int32(age),
            balance: Int64(balance))

        service.createUser(request: request) { response in
            self.user = User(
                id: response.id,
                username: response.username,
                email: response.email,
                age: response.age,
                balance: response.balance
            )
            print("DEBUG: \(self.user)")
            print("DEBUG: \(self.user?.id)")
        }
    }
}
