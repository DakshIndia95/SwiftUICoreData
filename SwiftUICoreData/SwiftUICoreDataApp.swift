//
//  SwiftUICoreDataApp.swift
//  SwiftUICoreData
//
//  Created by Neosoft on 10/08/23.
//

import SwiftUI

@main
struct SwiftUICoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
