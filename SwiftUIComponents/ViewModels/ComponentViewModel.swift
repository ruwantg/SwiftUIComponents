//
//  ComponentViewModel.swift
//  SwiftUIComponents
//
//  Created by Ruwan Thalgahage on 2024-07-19.
//

import Foundation

class ComponentViewModel: ObservableObject {
    @Published var components: [Component] = []
    @Published var searchText: String = ""
    
    init() {
        loadComponents()
    }
    
    private func loadComponents() {
        components = [
            // Section 1: Text Input/Output
            Component(title: "Text", systemIconName: "textformat", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/text")),
            Component(title: "Label", systemIconName: "tag", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/label")),
            Component(title: "TextField", systemIconName: "square.and.pencil", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/textfield")),
            Component(title: "SecureField", systemIconName: "lock", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/securefield")),
            Component(title: "TextArea", systemIconName: "doc.plaintext", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/textarea")),
            Component(title: "Image", systemIconName: "photo", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/image")),
            
            // Section 2: Controls
            Component(title: "Button", systemIconName: "hand.point.up.left.fill", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/button")),
            Component(title: "Menu", systemIconName: "ellipsis.circle", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/menu")),
            Component(title: "Link", systemIconName: "link", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/link")),
            Component(title: "Slider", systemIconName: "slider.horizontal.3", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/slider")),
            Component(title: "Stepper", systemIconName: "minus.slash.plus", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/stepper")),
            Component(title: "Toggle", systemIconName: "switch.2", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/toggle")),
            Component(title: "Picker", systemIconName: "list.bullet", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/picker")),
            Component(title: "DatePicker", systemIconName: "calendar", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/datepicker")),
            Component(title: "ColorPicker", systemIconName: "eyedropper", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/colorpicker")),
            Component(title: "ProgressView", systemIconName: "goforward", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/progressview")),
            
            // Section 3: Container Views
            Component(title: "HStack", systemIconName: "rectangle.split.3x3", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/hstack")),
            Component(title: "VStack", systemIconName: "rectangle.split.3x3", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/vstack")),
            Component(title: "ZStack", systemIconName: "square.3.layers.3d.down.right", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/zstack")),
            Component(title: "Form", systemIconName: "list.bullet.rectangle", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/form")),
            Component(title: "NavigationView", systemIconName: "rectangle.on.rectangle", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/navigationview")),
            Component(title: "Alerts", systemIconName: "exclamationmark.triangle", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/alert")),
            Component(title: "Sheets", systemIconName: "square.and.arrow.up", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/sheet")),
            
            // Section 4: List
            Component(title: "Plain List", systemIconName: "list.dash", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list")),
            Component(title: "Inset List", systemIconName: "list.bullet", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list")),
            Component(title: "Grouped List", systemIconName: "list.bullet.rectangle", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list")),
            Component(title: "Inset Grouped List", systemIconName: "list.bullet.rectangle.portrait", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list")),
            Component(title: "Sidebar List", systemIconName: "sidebar.left", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list"))
        ]
    }
    
    var filteredComponents: [Component] {
        if searchText.isEmpty {
            return components
        } else {
            return components.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}
