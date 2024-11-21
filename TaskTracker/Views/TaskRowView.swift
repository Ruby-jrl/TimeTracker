//
//  TaskRowView.swift
//  TaskTracker
//
//  Created by Ruby Liu on 09/10/2024.
//

import SwiftUI

// basic version: no progress bar, no delete button
//struct TaskRowView: View {
//    let task: Task
//    @ObservedObject var taskVM: TaskViewModel
//    @State private var hoursToAdd = ""
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(task.name).font(.headline)
//            Text("Goal: \(task.goal, specifier: "%.2f") hours").font(.subheadline)
//            Text("Hours spent: \(task.hoursSpent, specifier: "%.2f") hours").font(.subheadline)
//
//            // Progress bar for the task
//            ProgressView(value: task.hoursSpent, total: task.goal)
//                .progressViewStyle(LinearProgressViewStyle())
//                .padding(.vertical, 5)
//            
//            HStack {
//                TextField("Hours to add", text: $hoursToAdd)
//                    .keyboardType(.decimalPad)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Button(action: {
//                    if let hours = Double(hoursToAdd) {
//                        taskVM.updateHours(task: task, hours: hours)
//                        hoursToAdd = ""
//                    }
//                }) {
//                    Text("Add Hours")
//                }
//                .disabled(hoursToAdd.isEmpty)
//            }
//        }
//        .padding()
//    }
//}


struct TaskRowView: View {
    let task: Task
    @ObservedObject var taskVM: TaskViewModel
    @State private var hoursToAdd = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text(task.name)
                .font(.headline)
            
            // Show the task goal and hours spent
            Text("Goal: \(task.goal, specifier: "%.2f") hours")
                .font(.subheadline)
            Text("Hours spent: \(task.hoursSpent, specifier: "%.2f") hours")
                .font(.subheadline)
            
            // Progress bar for the task
            ProgressView(value: task.hoursSpent, total: task.goal)
                .progressViewStyle(LinearProgressViewStyle())
                .padding(.vertical, 5)

            // Section to add more hours to the task
            HStack {
                TextField("Hours to add", text: $hoursToAdd)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    if let hours = Double(hoursToAdd) {
                        taskVM.updateHours(task: task, hours: hours)
                        hoursToAdd = ""
                    }
                }) {
                    Text("Add Hours")
                }
                .disabled(hoursToAdd.isEmpty)
            }
            .padding()
            
            // Delete button
            Button(action: {
                taskVM.removeTask(task: task)  // Call the removeTask method
            }) {
                Text("Delete Task")
                    .foregroundColor(.red)  // Make the delete button stand out
            }
            .padding(.top, 5)
            .buttonStyle(PlainButtonStyle()) // default button style can sometimes make the entire row (or surrounding areas) seem tappable or interactive
        }
        .padding()
    }
}
