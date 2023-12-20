//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

@main
struct JournalAppApp: App {
    
    // MARK: - Properties
    @StateObject private var viewModel = DailyNewsViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            TabView {
                DailyNewsView()
                    .environmentObject(viewModel)
                    .tabItem {
                        Image(systemName: "storefront")
                        Text("Shop")
                    }
                FavoriteNewsView()
                    .environmentObject(viewModel)
                    .tabItem {
                        Image(systemName: "star")
                        Text("favorite")
                    }
            }
        }
    }
}
