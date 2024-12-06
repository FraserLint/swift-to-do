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
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    HStack {
                        Button {
                            toDo.isCompleted.toggle()
                        } label: {
                            Image(systemName: toDo.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                        
                        Text(toDo.title)
                    }
                }
                .onDelete(perform: deleteToDos)
            }
            .navigationTitle("ToDo App")
            .toolbar {
                Button {
                    isAlertShowing.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            .alert("Add ToDO", isPresented: $isAlertShowing) {
                TextField("Enter ToDo", text: $toDoTitle)
                
                Button {
                    modelContext.insert(ToDo(title: toDoTitle, isCompleted: false))
                    
                    toDoTitle = ""
                } label: {
                    Text("Add")
                }
                
            }
            .overlay {
                if toDos.isEmpty {
                    ContentUnavailableView("Nothing to do here.", systemImage: "checkmark.circle.fill")
                }
            }
        }
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
