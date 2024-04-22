//
//  bay_calculatorApp.swift
//  bay-calculator
//
//  Created by Ben Stacey on 22/04/24.
//

import SwiftUI
import SwiftData

@main
struct bay_calculatorApp: App {
    let container: ModelContainer = {
        let schema = Schema([User.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
