//
//  ToDOApp.swift
//  ToDO
//
//  Created by Austin Davison on 06/12/2024.
//

import SwiftUI
import SwiftData

@main
struct ToDOApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDo.self)
    }
}


@Model class ToDo {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}


extension Bool: @retroactive Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        !lhs && rhs
    }
}
