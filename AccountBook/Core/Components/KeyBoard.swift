//
//  KeyBoard.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/20.
//

import SwiftUI

/// キーボード出現時に全体をオフセットする拡張。
struct KeyBoard: ViewModifier {

    @State var offset: CGFloat = 0

    func body(content: Content) -> some View {
        content.padding(.bottom, offset).onAppear {
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main
            ) { (_) in
                /// 実際に底上げを行う部分。
                self.offset = 1
            }

            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main
            ) { (_) in

                self.offset = 0
            }
        }
    }
}
