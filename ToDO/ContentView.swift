//
//  ContentView.swift
//  ToDO
//
//  Created by Austin Davison on 06/12/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ToDo.isCompleted) private var toDos: [ToDo]
    
    @State private var isAlertShowing = false
    @State private var toDoTitle = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func deleteToDos(_ indexSet: IndexSet) {
        for i in indexSet {
            let toDo = toDos[i]
            modelContext.delete(toDo)
        }
    }
}

#Preview {
    ContentView()
}
