//
//  TaskViewModel.swift
//  TaskTracker
//
//  Created by Ruby Liu on 09/10/2024.
//
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []  // List of tasks

    // Method to add a new task
    func addTask(name: String, goal: Double) {
        let newTask = Task(name: name, goal: goal, hoursSpent: 0.0)
        tasks.append(newTask)
    }

    // Method to update hours spent on a task
    func updateHours(task: Task, hours: Double) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            print("Before update: \(tasks[index].hoursSpent)")
            tasks[index].hoursSpent += hours
            print("After update: \(tasks[index].hoursSpent)")
        }
    }

    // Method to remove a task from the list
    func removeTask(task: Task) {
        print("Removing task: \(task.name)")
        tasks.removeAll { $0.id == task.id }
    }
    
    func editTask(task: Task) {
        print(task.name)
    }
}

