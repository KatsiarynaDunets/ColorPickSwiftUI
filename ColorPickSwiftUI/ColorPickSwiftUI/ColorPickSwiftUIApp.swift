//
//  ColorPickSwiftUIApp.swift
//  ColorPickSwiftUI
//
//  Created by Kate on 13/12/2023.
//

import SwiftUI

@main
struct ColorPickSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
