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
    
    @Published var buttonText: String = "Click Me"
    
    init() {
        loadComponents()
    }
    
    private func loadComponents() {
        components = [
            // Section 1: Text Input/Output
            Component(title: "Text", systemIconName: "textformat", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/text"), type: .text),
            Component(title: "Label", systemIconName: "tag", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/label"), type: .label),
            Component(title: "TextField", systemIconName: "square.and.pencil", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/textfield"), type: .textField),
            Component(title: "SecureField", systemIconName: "lock", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/securefield"), type: .secureField),
            Component(title: "TextArea", systemIconName: "doc.plaintext", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/textarea"), type: .textArea),
            Component(title: "Image", systemIconName: "photo", category: .textInputOutput, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/image"), type: .image),
            
            // Section 2: Controls
            Component(title: "Button", systemIconName: "hand.point.up.left.fill", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/button"), type: .button),
            Component(title: "Menu", systemIconName: "ellipsis.circle", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/menu"), type: .menu),
            Component(title: "Link", systemIconName: "link", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/link"), type: .link),
            Component(title: "Slider", systemIconName: "slider.horizontal.3", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/slider"), type: .slider),
            Component(title: "Stepper", systemIconName: "minus.slash.plus", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/stepper"), type: .stepper),
            Component(title: "Toggle", systemIconName: "switch.2", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/toggle"), type: .toggle),
            Component(title: "Picker", systemIconName: "list.bullet", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/picker"), type: .picker),
            Component(title: "DatePicker", systemIconName: "calendar", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/datepicker"), type: .datePicker),
            Component(title: "ColorPicker", systemIconName: "eyedropper", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/colorpicker"), type: .colorPicker),
            Component(title: "ProgressView", systemIconName: "goforward", category: .controls, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/progressview"), type: .progressView),
            
            // Section 3: Container Views
            Component(title: "HStack", systemIconName: "rectangle.split.3x3", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/hstack"), type: .hStack),
            Component(title: "VStack", systemIconName: "rectangle.split.3x3", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/vstack"), type: .vStack),
            Component(title: "ZStack", systemIconName: "square.3.layers.3d.down.right", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/zstack"), type: .zStack),
            Component(title: "Form", systemIconName: "list.bullet.rectangle", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/form"), type: .form),
            Component(title: "NavigationView", systemIconName: "rectangle.on.rectangle", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/navigationview"), type: .navigationView),
            Component(title: "Alerts", systemIconName: "exclamationmark.triangle", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/alert"), type: .alerts),
            Component(title: "Sheets", systemIconName: "square.and.arrow.up", category: .containerViews, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/sheet"), type: .sheets),
            
            // Section 4: List
            Component(title: "Plain List", systemIconName: "list.dash", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list"), type: .plainList),
            Component(title: "Inset List", systemIconName: "list.bullet", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list"), type: .insetList),
            Component(title: "Grouped List", systemIconName: "list.bullet.rectangle", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list"), type: .groupedList),
            Component(title: "Inset Grouped List", systemIconName: "list.bullet.rectangle.portrait", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list"), type: .insetGroupedList),
            Component(title: "Sidebar List", systemIconName: "sidebar.left", category: .list, documentationURL: URL(string: "https://developer.apple.com/documentation/swiftui/list"), type: .sidebarList)
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
