//
//  CustomNumberField.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/21.
//

import SwiftUI

/// 数値入力用の入力欄。
struct CustomNumberField: View {

    let imageName: String
    let placeholderText: String
    var textColor: Color = Color.white
    var placeholderColor: Color = Color.gray
    @Binding var text: String
    var onEnd: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))

                TextFieldWithToolbar(placeholder: placeholderText, text: $text, onEnd: onEnd)
            }

            /// 下線。
            Divider()
                .background(Color(.darkGray))
        }
        .frame(height: 40)
    }
}

struct TextFieldWithToolbar: UIViewRepresentable {

    var fontSize: CGFloat = 20
    var placeholder: String
    @Binding var text: String
    var onEnd: () -> Void

    func makeCoordinator() -> Coordinator {

        return TextFieldWithToolbar.Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> some UITextView {

        let textView = UITextView()

        textView.text = placeholder
        textView.textColor = .gray
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: fontSize)
        // 数字のみのキーボードに設定
        textView.keyboardType = .decimalPad
        // delegateを設定
        textView.delegate = context.coordinator

        // ツールバー（DONEボタン）
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))

        toolBar.barStyle = .default

        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: context.coordinator,
            action: #selector(context.coordinator.closeKayBoard))

        toolBar.items = [spacer, doneButton]
        toolBar.sizeToFit()

        textView.inputAccessoryView = toolBar

        return textView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    class Coordinator: NSObject, UITextViewDelegate {

        var parent: TextFieldWithToolbar

        init(parent: TextFieldWithToolbar) {

            self.parent = parent
        }

        // Keyborad Close @objc Function
        @objc func closeKayBoard() {

            parent.onEnd()
        }

        func textViewDidBeginEditing(_ textView: UITextView) {

            if textView.text == parent.placeholder {
                textView.text = ""
                textView.textColor = UIColor(Color.white)
            }
        }

        func textViewDidChange(_ textView: UITextView) {

            parent.text = textView.text
        }

        func textViewDidEndEditing(_ textView: UITextView) {

            if textView.text == "" {
                textView.text = parent.placeholder
                textView.textColor = .gray
            }
        }
    }
}
