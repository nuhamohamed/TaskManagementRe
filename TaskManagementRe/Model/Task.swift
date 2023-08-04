//
//  Task.swift
//  TaskManagementRe
//
//  Created by Nuha Mohamed on 8/3/23.
//


import SwiftUI

// Task Model
struct Task: Identifiable{
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
