//
//  TaskRowView.swift
//  TaskTracker
//
//  Created by Ruby Liu on 09/10/2024.
//

import SwiftUI

struct TaskRowView: View {
    let task: Task
    @ObservedObject var taskVM: TaskViewModel
    @State private var hoursToAdd = ""

    var body: some View {
//        VStack(alignment: .leading) {
//            Text(task.name)
//                .font(.headline)
//            
//            // Show the task goal and hours spent
//            HStack{
//                Text("Spent: \(task.hoursSpent, specifier: "%.1f") hours")
//                    .font(.subheadline)
//                Spacer()
//                Text("Goal: \(task.goal, specifier: "%.1f") hours")
//                    .font(.subheadline)
//            }
//            
//            // Progress bar for the task
//            ProgressView(value: task.hoursSpent, total: task.goal)
//                .progressViewStyle(LinearProgressViewStyle())
//                .tint(task.hoursSpent <= task.goal ? .blue : .green)
//                .padding(1)
//
//            // Section to add more hours to the task
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
//            .padding(1)
//            
//            // Delete button
//            Button(action: {
//                taskVM.removeTask(task: task)  // Call the removeTask method
//            }) {
//                Text("Delete Task")
//                    .foregroundColor(.red)
//            }
//            .padding(1)
//            .buttonStyle(PlainButtonStyle()) // default button style can sometimes make the entire row (or surrounding areas) seem tappable or interactive
//        }
//        .padding(2)
        
        VStack {
            Text(task.name)
                .font(.headline)
                .padding(2)
            
            HStack{
                Text("Spent: \(task.hoursSpent, specifier: "%.1f") hours")
                    .font(.subheadline)
                Spacer()
                Text("Goal: \(task.goal, specifier: "%.1f") hours")
                    .font(.subheadline)
            }
            
            ProgressView(value: task.hoursSpent, total: task.goal)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(task.hoursSpent <= task.goal ? .blue : .green)
                .padding(1)
            
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
            .padding(1)
            
        }
        .padding(1)
        // swipe left for delete
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                taskVM.removeTask(task: task)
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
        // swipe right for edit
//        .swipeActions(edge: .leading) {
//            Button {
//                taskVM.editTask(task: task)
//            } label: {
//                Label("Edit", systemImage: "pencil")
//            }
//        }
        
    }
}
