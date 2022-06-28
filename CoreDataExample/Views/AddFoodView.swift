//
//  AddFoodView.swift
//  CoreDataExample
//
//  Created by 李晨 on 2022/6/28.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section() {
                TextField("Food name", text: $name)
                
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    
                    Button {
                        DataController().addFood(name: name, calories: calories, context: managedObjContext)
                    } label: {
                        Label("Submit", systemImage: "paperplane.fill")
                            .accessibilityLabel("Submit Your Edit")
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
