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
    let component: Component
    
    var body: some View {
        VStack {
            Text("Datail about \(component.title)")
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
