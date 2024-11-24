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
        
        VStack(alignment: .leading) {
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
                .tint(task.hoursSpent < task.goal ? .blue : .green)
                .padding(1)
            
            HStack {
                TextField("Hours to add", text: $hoursToAdd)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer() // Push the button to the right
                            Button("Done") {
                                hideKeyboard() // Dismiss the keyboard
                            }
                        }
                    }
                    // works and seems to add toolbar for all pad
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
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
