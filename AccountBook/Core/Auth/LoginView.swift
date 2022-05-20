//
//  LoginView.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/18.
//

import SwiftUI

/// ログイン画面。
struct LoginView: View {
    /// メールアドレス。
    @State private var email = ""
    /// パスワード。
    @State private var password = ""
    /// ViewModel。
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {

        VStack {
            Spacer()

            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 isSecureField: false,
                                 text: $email)

                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)

            HStack {
                Spacer()

                NavigationLink {
                    Text("Reset Password view...")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.accentGreen)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }

            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color.darkGreen)
                    .clipShape(Capsule())
                    .padding()
            }

            NavigationLink {
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)

                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color.accentGreen)
        }
        .padding(.vertical, 32)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backGround)
        .modifier(KeyBoard())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
