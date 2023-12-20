//
//  NewsFormComponent.swift
//  JournalApp
//
//  Created by Levan Loladze on 20.12.23.
//

import SwiftUI

struct NewsFormComponent: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: DailyNewsViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("title", text: $viewModel.title)
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
            }
            .background(Color.white)
            .scrollContentBackground(.hidden)
        }
    }
}
