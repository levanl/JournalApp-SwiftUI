//
//  JournalEntryListComponent.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

struct JournalEntryListComponent: View {
    
    // MARK: - Properties
    @State private var isEditingSheetPresented = false
    @Binding var journalEntrie: JournalEntry
    @EnvironmentObject private var viewModel: DailyNewsViewModel
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text("\(journalEntrie.title) - \(viewModel.formattedDate(date: journalEntrie.date))")
            
            Spacer()
            
            Image(systemName: "pencil")
                .foregroundColor(.black)
                .onTapGesture {
                    isEditingSheetPresented.toggle()
                }
                .sheet(isPresented: $isEditingSheetPresented) {
                    JournalEditingView(isEditingSheetPresented: $isEditingSheetPresented, journalEntrie: $journalEntrie)
                }
            
            Image(systemName: journalEntrie.isFavorite ? "star.fill" : "star")
                .foregroundColor(.yellow)
                .onTapGesture {
                    viewModel.toggleFavorite(for: journalEntrie)
                }
            
        }
    }
}
