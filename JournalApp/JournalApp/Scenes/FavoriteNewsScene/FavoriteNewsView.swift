//
//  FavoriteNewsView.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

struct FavoriteNewsView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: DailyNewsViewModel
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.journalEntries.filter { $0.isFavorite }, id: \.self) { favoriteEntry in
                Text("\(favoriteEntry.title) - \(viewModel.formattedDate(date: favoriteEntry.date))")
            }
        }
    }
}

#Preview {
    FavoriteNewsView()
        .environmentObject(DailyNewsViewModel())
}
