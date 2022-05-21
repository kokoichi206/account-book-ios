//
//  UserService.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/17.
//

import Foundation
import Alamofire
import SwiftUI

struct UserService: UserServiceProtocol {

    func createUser(request: CreateUserRequest, completion: @escaping(CreateUserResponse) -> Void) {
        // structをDictionaryに変換する。
        let dict = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(request)) as? [String: Any] ?? [:]
        AF.request(APIConfig.baseURL + "/users",
                   method: .post,
                   parameters: dict,
                   encoding: JSONEncoding.default)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                        do {
                            let decoder = JSONDecoder()
                            let user = try decoder.decode(CreateUserResponse.self, from: data)
                            completion(user)
                        } catch {
                            print(error)
                            print(error.localizedDescription)
                        }
                    }
                case .failure(let error):
                    print("error:\(error)")
                }
            }
    }

    func loginUser(request: LoginUserRequest, completion: @escaping(CreateUserResponse) -> Void) {
        let dict = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(request)) as? [String: Any] ?? [:]
        AF.request(APIConfig.baseURL + "/login",
                   method: .post,
                   parameters: dict,
                   encoding: JSONEncoding.default)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                        do {
                            let decoder = JSONDecoder()
                            let user = try decoder.decode(CreateUserResponse.self, from: data)
                            completion(user)
                        } catch {
                            print(error)
                            print(error.localizedDescription)
                        }
                    }
                case .failure(let error):
                    print("error:\(error)")
                }
            }
    }
}
