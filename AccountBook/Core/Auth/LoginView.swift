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

            loginInfo

            forgotPassword

            signInButton

            askHaveNotAccountButton
        }
        .padding(.vertical, 32)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backGround)
        .modifier(KeyBoard())
    }
}

extension LoginView {
    /// 基礎項目入力欄。
    /// - メールアドレス
    /// - パスワード
    var loginInfo: some View {
        VStack(spacing: 40) {
            CustomInputField(imageName: "envelope",
                             placeholderText: NSLocalizedString("emailPlaceholder", comment: ""),
                             isSecureField: false,
                             text: $email)

            CustomInputField(imageName: "lock",
                             placeholderText: NSLocalizedString("passwordPlaceholder", comment: ""),
                             isSecureField: true,
                             text: $password)
        }
        .padding(.horizontal, 32)
        .padding(.top, 44)
    }

    /// パスワード忘れた場合の場面
    var forgotPassword: some View {
        HStack {
            Spacer()

            NavigationLink {
                Text("Reset Password view...")
            } label: {
                Text("forgotPassword")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.accentGreen)
                    .padding(.top)
                    .padding(.trailing, 24)
            }
        }
    }

    /// サインインのボタン。
    var signInButton: some View {
        Button {
            viewModel.login(withEmail: email, password: password)
        } label: {
            Text("signIn")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 340, height: 50)
                .background(Color.darkGreen)
                .clipShape(Capsule())
                .padding()
        }
    }

    /// 新規登録の画面に切り替えるボタン。
    var askHaveNotAccountButton: some View {
        NavigationLink {
            SignUpView()
        } label: {
            HStack {
                Text("askHaveNotAccount")
                    .font(.footnote)

                Text("signUp")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
        }
        .padding(.bottom, 32)
        .foregroundColor(Color.accentGreen)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
