//
//  SignUpView.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/21.
//

import SwiftUI

/// 新規登録画面。
struct SignUpView: View {
    /// ユーザー名。
    @State private var username = ""
    /// メールアドレス。
    @State private var email = ""
    /// パスワード。
    @State private var password = ""
    /// 年齢。
    @State private var age = ""
    /// 残高。
    @State private var balance = ""
    /// ViewModel。
    @EnvironmentObject var viewModel: AuthViewModel
    /// 詳細画面で決定中かどうか。
    @State private var isDetailedView = false

    var body: some View {

        VStack {
            Spacer()

            if isDetailedView {
                detailedInput
            } else {
                basicInput
            }

            nextButton

            askHaveAccountButton
        }
        .padding(.vertical, 32)
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backGround)
        .modifier(KeyBoard())
    }
}

extension SignUpView {
    /// 基礎項目入力欄。
    /// - ユーザー名
    /// - メールアドレス
    /// - パスワード
    var basicInput: some View {
        VStack(spacing: 40) {
            /// ユーザー名入力欄。
            CustomInputField(imageName: "person",
                             placeholderText: NSLocalizedString("usernamePlaceholder", comment: ""),
                             isSecureField: false,
                             text: $username)

            /// メールアドレス入力欄。
            CustomInputField(imageName: "envelope",
                             placeholderText: NSLocalizedString("emailPlaceholder", comment: ""),
                             isSecureField: false,
                             text: $email)

            /// パスワード入力欄。
            CustomInputField(imageName: "lock",
                             placeholderText: NSLocalizedString("passwordPlaceholder", comment: ""),
                             isSecureField: true,
                             text: $password)
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
    }

    /// 詳細項目入力欄（任意）。
    /// - 年齢
    /// - 貯金額
    var detailedInput: some View {
        VStack(spacing: 40) {
            /// 年齢入力欄。
            CustomNumberField(
                imageName: "figure.stand",
                placeholderText: NSLocalizedString("agePlaceholder", comment: ""),
                text: $age) {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil, from: nil, for: nil)
            }

            /// 貯金額入力欄。
            CustomNumberField(
                imageName: "yensign.square",
                placeholderText: NSLocalizedString("balancePlaceholder", comment: ""),
                text: $balance) {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil, from: nil, for: nil)
            }
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
    }

    /// 登録ボタン。
    var nextButton: some View {
        Button {
            if !isDetailedView {
                isDetailedView = true
            } else {
            }
        } label: {
            Text(isDetailedView ? "signUp" : "next")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 340, height: 50)
                .background(Color.darkGreen)
                .clipShape(Capsule())
                .padding()
        }
    }

    /// サインインの画面に切り替えるためのボタン。
    var askHaveAccountButton: some View {
        NavigationLink {
            LoginView()
        } label: {
            HStack {
                Text("askHaveAccount")
                    .font(.footnote)

                Text("signIn")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
        }
        .padding(.bottom, 32)
        .foregroundColor(Color.accentGreen)
    }
}
