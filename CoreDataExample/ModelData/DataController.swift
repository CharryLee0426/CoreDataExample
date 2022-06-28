//
//  DataController.swift
//  CoreDataExample
//
//  Created by 李晨 on 2022/6/28.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    // init method is used to load the data from the Core Data Model
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load Data in Data Controller \(error.localizedDescription)")
            }
        }
    }
    
    // CRUD
    
    // Save
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully✅")
        } catch {
            // Handle errors in the database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    // Add
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        let food = Food(context: context)
        food.id = UUID()
        food.name = name
        food.calories = calories
        food.date = Date()
        
        save(context: context)
    }
    
    // Edit
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
}
