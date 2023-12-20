//
//  JournalEditingView.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

struct JournalEditingView: View {
    
    // MARK: - Properties
    @Binding var isEditingSheetPresented: Bool
    @Binding var journalEntrie: JournalEntry
    @EnvironmentObject private var viewModel: DailyNewsViewModel
    
    // MARK: - Body
    var body: some View {
        Form {
            Section {
                TextField("title", text: $journalEntrie.title)
            } header: {
                Text("Journal Title")
            }
            .listRowBackground(Color(red: 246/255, green: 246/255, blue: 246/255))
            
            Section {
                DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
            } header: {
                Text("Journal Date")
            }
            .listRowBackground(Color(red: 246/255, green: 246/255, blue: 246/255))
            
            Section {
                TextField("Description", text: $viewModel.description, axis: .vertical)
                    .lineLimit(2)
                
            } header: {
                Text("Journal Description")
            }
            .listRowBackground(Color(red: 246/255, green: 246/255, blue: 246/255))
            
            
            Button(action: {
                viewModel.saveJournalEntry()
                isEditingSheetPresented = false
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .font(.headline)
            }
            .background(.green)
            .cornerRadius(10)
            
        }
        .background(Color.white)
        .scrollContentBackground(.hidden)
        .padding(.top)
        
    }
}

