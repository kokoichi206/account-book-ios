//
//  AccountBookApp.swift
//  AccountBook
//
//  Created by Takahiro Tominaga on 2022/05/09.
//

import SwiftUI

@main
struct AccountBookApp: App {

    @StateObject var viewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
