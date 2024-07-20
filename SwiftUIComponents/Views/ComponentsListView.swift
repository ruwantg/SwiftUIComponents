//
//  ContentView.swift
//  SwiftUIComponents
//
//  Created by Ruwan Thalgahage on 2024-07-18.
//

import SwiftUI

struct ComponentsListView: View {
    @StateObject private var viewModel = ComponentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(ComponentCategory.allCases, id: \.self) { category in
                    componentSection(for: category)
                }
            }
            .navigationTitle("Components")
            .searchable(text: $viewModel.searchText)
        }
    }
    
    private func componentSection(for category: ComponentCategory) -> some View {
        Section(header: Text(category.rawValue)) {
            ForEach(viewModel.filteredComponents.filter { $0.category == category}) { component in
                NavigationLink(destination: ComponentDetailView(component: component)) {
                    HStack {
                        Image(systemName: component.systemIconName)
                        Text(component.title)
                    }
                }
                
            }
        }
    }
    
}

#Preview {
    ComponentsListView()
}
