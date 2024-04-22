//
//  ContentView.swift
//  bay-calculator
//
//  Created by Ben Stacey on 22/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        Text(user.firstName + " " + user.lastName )
                    } label: {
                        Text(user.firstName + " " + user.lastName )
                    }
                }
                .onDelete(perform: deleteUsers)
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addUser) {
//                        Label("Add User", systemImage: "plus")
//                    }
//                }
//            }
        } detail: {
            Text("Select an item")
        }
    }

    private func deleteUsers(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(users[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
