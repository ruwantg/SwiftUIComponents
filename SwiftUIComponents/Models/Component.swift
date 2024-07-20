//
//  Component.swift
//  SwiftUIComponents
//
//  Created by Ruwan Thalgahage on 2024-07-19.
//

import Foundation

struct Component: Identifiable {
    let id = UUID()
    let title: String
    let systemIconName: String
    let category: ComponentCategory
    let documentationURL: URL?
    let type: ComponentType
}

enum ComponentCategory: String, CaseIterable {
    case textInputOutput = "Text Input/Output"
    case controls = "Controls"
    case containerViews = "Container Views"
    case list = "List"
}

enum ComponentType: String {
    case text
    case label
    case textField
    case secureField
    case textArea
    case image
    case button
    case menu
    case link
    case slider
    case stepper
    case toggle
    case picker
    case datePicker
    case colorPicker
    case progressView
    case hStack
    case vStack
    case zStack
    case form
    case navigationView
    case alerts
    case sheets
    case plainList
    case insetList
    case groupedList
    case insetGroupedList
    case sidebarList
}
