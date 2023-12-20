//
//  DailyNewsViewModel.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

// MARK: - ViewModel
final class DailyNewsViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var title = ""
    @Published var date = Date()
    @Published var journalEntries: [JournalEntry] = [JournalEntry(title: "Swiftui", date: Date(), description: "good")]
    @Published var description = ""
    @Published var selectedJournal: JournalEntry?
    
    // MARK: - Save Journal
    func saveJournalEntry() {
        if !title.isEmpty && !description.isEmpty {
            let newEntry = JournalEntry(title: title, date: date, description: description)
            
            journalEntries.append(newEntry)
            
            title = ""
            description = ""
            date = Date()
        }
    }
    
    // MARK: - Formatt date
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    // MARK: - Move Journal
    func moveJournal(fromOffsets: IndexSet, toOffset: Int) {
        journalEntries.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    // MARK: - Remove Journal
    func removeJournal(at index: IndexSet) {
        journalEntries.remove(atOffsets: index)
    }
    
    // MARK: - Favorite toggle
    func toggleFavorite(for entry: JournalEntry) {
        if let index = journalEntries.firstIndex(where: { $0.id == entry.id }) {
            journalEntries[index].isFavorite.toggle()
        }
    }
}
