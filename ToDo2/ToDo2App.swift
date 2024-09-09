//
//  ToDo2App.swift
//  ToDo2
//
//  Created by NOZOMI ISHII on 2024/08/25.
//

import SwiftUI

@main
struct ToDo2App: App {
    
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
