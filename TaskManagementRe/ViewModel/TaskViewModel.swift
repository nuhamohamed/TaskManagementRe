//
//  TaskViewModel.swift
//  TaskManagementRe
//
//  Created by Nuha Mohamed on 8/3/23.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    /*struct TaskViewModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TaskViewModel_Previews: PreviewProvider {
    static var previews: some View {
        TaskViewModel()
    }
}*/
    //sample tasks
    
    @Published var storedTasks: [Task] = [
    
        Task(taskTitle: "Meeting", taskDescription: "Discuss team plan for the day", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Prototype", taskDescription: "Make and send in prototype", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Error check", taskDescription: "Check for bugs", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Next Project", taskDescription: "Explain next project to team", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Plan", taskDescription: "Prepare project plan for next week", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "App Proposal", taskDescription: "Create slideshow for proposal", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Client Meeting", taskDescription: "Meet with client regarding app", taskDate: .init(timeIntervalSince1970: 1641645497))
        
        
    ]
}
