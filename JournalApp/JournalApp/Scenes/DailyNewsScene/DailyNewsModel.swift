//
//  DailyNewsModel.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

// MARK: - JournalEntryModel
struct JournalEntry: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var date: Date
    var description: String
    var isFavorite: Bool = true
}
