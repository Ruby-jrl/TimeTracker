//
//  ContentView.swift
//  TaskTracker
//
//  Created by Ruby Liu on 09/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var taskVM = TaskViewModel()  // ViewModel instance
    @State private var newTaskName = ""  // Holds new task name
    @State private var newTaskGoal = ""  // Holds new task goal (in hours)

    var body: some View {
        NavigationView {
            VStack {
                // Add new task section
                HStack {
                    TextField("Task name", text: $newTaskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Goal (hours)", text: $newTaskGoal)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        if let goal = Double(newTaskGoal) {
                            taskVM.addTask(name: newTaskName, goal: goal)
                            print(goal)
                            newTaskName = ""
                            newTaskGoal = ""
                        }
                    }) {
                        Text("Add Task")
                    }
                    .disabled(newTaskName.isEmpty || newTaskGoal.isEmpty)
                }
                .padding()

                // List of tasks
                List(taskVM.tasks) { task in
                    TaskRowView(task: task, taskVM: taskVM)
                }
            }
            .navigationTitle("Task Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

