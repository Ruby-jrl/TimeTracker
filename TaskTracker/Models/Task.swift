//
//  Task.swift
//  TaskTracker
//
//  Created by Ruby Liu on 09/10/2024.
//
import Foundation

struct Task: Identifiable {
    let id = UUID()   // Unique identifier for each task
    var name: String  // Task name
    var goal: Double  // Weekly goal in hours
    var hoursSpent: Double  // Hours spent on this task so far
}
