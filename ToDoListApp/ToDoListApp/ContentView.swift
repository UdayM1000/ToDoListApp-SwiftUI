//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Ayush Bhagat on 19/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = []
    @State private var newTask: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter a task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                        let trimmed = newTask.trimmingCharacters(in: .whitespaces)
                        if !trimmed.isEmpty {
                            tasks.append(trimmed)
                            newTask = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }

                List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete(perform: { indexSet in
                        tasks.remove(atOffsets: indexSet)
                    })
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}


