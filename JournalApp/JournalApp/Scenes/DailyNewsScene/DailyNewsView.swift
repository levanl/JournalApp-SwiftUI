//
//  DailyNewsView.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

struct DailyNewsView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: DailyNewsViewModel
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            
            NewsFormComponent()
            
            List {
                ForEach(viewModel.journalEntries.indices, id: \.self) { index in
                    JournalEntryListComponent(journalEntrie: $viewModel.journalEntries[index])
                }
                .onMove(perform: viewModel.moveJournal)
                .onDelete(perform: viewModel.removeJournal)
            }
            .listStyle(.plain)
            .overlay(Group {
                if viewModel.journalEntries.isEmpty {
                    Text("no journal data here")
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        viewModel.saveJournalEntry()
                    }
                }
            }
        }
    }
}

#Preview {
    DailyNewsView()
        .environmentObject(DailyNewsViewModel())
}


