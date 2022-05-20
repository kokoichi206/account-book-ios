//
//  View.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/21.
//

import SwiftUI

/// Viewに関する拡張。
extension View {
    /// PlaceHolder の色をカスタマイズする。
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
