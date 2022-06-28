//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by 李晨 on 2022/6/28.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    // inject the data model to the app
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
