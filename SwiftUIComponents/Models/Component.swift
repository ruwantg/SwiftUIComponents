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
}

enum ComponentCategory: String, CaseIterable {
    case textInputOutput = "Text Input/Output"
    case controls = "Controls"
    case containerViews = "Container Views"
    case list = "List"
}
