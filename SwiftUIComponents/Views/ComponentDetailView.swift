//
//  ComponentDetailView.swift
//  SwiftUIComponents
//
//  Created by Ruwan Thalgahage on 2024-07-19.
//

import Foundation
import SwiftUI
import SafariServices

struct ComponentDetailView: View {
    @StateObject private var viewModel = ComponentViewModel()
    
    @State private var textAreaContent: String = "This is a TextArea"
    @State private var sliderValue: Double = 0.5
    @State private var stepperValue: Int = 0
    @State private var isSwitchOn: Bool = true
    @State private var selectedOption: Int = 1
    @State private var selectedMenuOption: String = "Select an option"
    @State private var selectedDate: Date = Date()
    @State private var selectedColor: Color = .black
    @State private var showAlert: Bool = false
    @State private var showSheet: Bool = false
    
    let component: Component
    
    var body: some View {
        VStack {
            Text("\(component.title)")
                .font(.title)
                .foregroundColor(selectedColor)
                .padding()
            
            // Switch between different component types
            switch component.type {
            case .text:
                Text("This is a Text component.")
                
            case .label:
                Label("This is a Label", systemImage: "tag")
            case .textField:
                TextField("Placeholder", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            case .secureField:
                SecureField("Password", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            case .textArea:
                TextEditor(text: $textAreaContent)
                    .border(Color.gray, width: 1)
                    .padding()
            case .image:
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.vertical)
            case .button:
                Button(action: {
                    viewModel.buttonText = "Clicked"
                }) {
                    Text(viewModel.buttonText)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            case .menu:
                Menu(selectedMenuOption) {
                    Button("Option 1") {
                        selectedMenuOption = "Option 1"
                    }
                    Button("Option 2") {
                        selectedMenuOption = "Option 2"
                    }
                }
                .padding()
            case .link:
                Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
                    .padding()
            case .slider:
                Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                    .font(.subheadline)
                    .padding()
                
                // Slider
                Slider(value: $sliderValue, in: 0...1)
                    .padding()
            case .stepper:
                Stepper("Value: \(stepperValue)", value: $stepperValue)
                    .padding()
            case .toggle:
                Toggle("Switch", isOn: $isSwitchOn)
                    .padding()
            case .picker:
                Picker("Options", selection: $selectedOption) {
                    Text("Option 1").tag(1)
                    Text("Option 2").tag(2)
                }
                .padding()
            case .datePicker:
                DatePicker("Select Date", selection: $selectedDate)
                    .padding()
            case .colorPicker:
                ColorPicker("Select Color", selection: $selectedColor)
                    .foregroundColor(selectedColor)
                    .padding()
            case .progressView:
                Spacer()
                ProgressView("Loading")
                    .padding()
                Spacer()
            case .hStack:
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<20) { index in
                            Text("Item \(index)")
                                .padding()
                        }
                    }
                }
                .padding()
            case .vStack:
                ScrollView {
                    VStack {
                        ForEach(0..<20) { index in
                            Text("Item \(index)")
                                .padding()
                        }
                    }
                }
                .padding()
            case .zStack:
                ZStack {
                    // Bottom square
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200)
                        .border(Color.black, width: 2)
                    
                    // Middle square
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 120, height: 120)
                        .border(Color.black, width: 2)
                        .opacity(0.75)
                    
                    // Top square
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 50, height: 50)
                        .border(Color.black, width: 2)
                        .opacity(0.75)
                }
                .padding()
            case .form:
                Form {
                    Text("Form content")
                }
                .padding()
            case .navigationView:
                NavigationView {
                    Text("NavigationView content")
                }
                .padding()
            case .alerts:
                Button("Show Alert") {
                    showAlert = true
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Alert Title"),
                        message: Text("This is an alert message."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            case .sheets:
                Button("Show Sheet") {
                    showSheet = true
                }
                .padding()
                .sheet(isPresented: $showSheet) {
                    VStack {
                        Text("This is a sheet view.")
                            .font(.title)
                        Button("Dismiss") {
                            showSheet = false
                        }
                        .padding()
                    }
                }
            case .plainList:
                List {
                    ForEach(0..<10) { index in
                        Text("Item \(index)")
                    }
                }
                .listStyle(PlainListStyle())
            case .insetList:
                List {
                    ForEach(0..<10) { index in
                        Text("Item \(index)")
                    }
                }
                .listStyle(InsetListStyle())
            case .groupedList:
                List {
                    Section(header: Text("Header")) {
                        ForEach(0..<10) { index in
                            Text("Item \(index)")
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            case .insetGroupedList:
                List {
                    Section(header: Text("Header")) {
                        ForEach(0..<10) { index in
                            Text("Item \(index)")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            case .sidebarList:
                List {
                    ForEach(0..<10) { index in
                        Text("Item \(index)")
                    }
                }
                .listStyle(SidebarListStyle())
                
            }
            
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: {
            openSafariView()
        }) {
            Image(systemName: "book")
        })
    }
    
    private func openSafariView() {
        guard let url = component.documentationURL else { return }
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow}) {
            let safariVC = SFSafariViewController(url: url)
            keyWindow.rootViewController?.present(safariVC, animated: true, completion: nil)
        }
    }
    
}
