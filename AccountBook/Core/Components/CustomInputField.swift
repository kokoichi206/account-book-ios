//
//  CustomInputField.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/18.
//

import SwiftUI

/// カスタマイズできる入力欄。
struct CustomInputField: View {

    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    var textColor: Color = Color.white
    var placeholderColor: Color = Color.gray
    @Binding var text: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))

                if isSecureField {
                    SecureField("", text: $text)
                        .placeholder(when: text.isEmpty) {
                            Text(placeholderText)
                                .foregroundColor(placeholderColor)
                        }
                        .foregroundColor(textColor)
                } else {
                    TextField("", text: $text)
                        .placeholder(when: text.isEmpty) {
                            Text(placeholderText)
                                .foregroundColor(placeholderColor)
                        }
                        .foregroundColor(textColor)
                }
            }

            /// 下線。
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeholderText: "Email",
                         isSecureField: false,
                         text: .constant(""))
    }
}
