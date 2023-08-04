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
    
    //MARK: current week days
    @Published var currentWeek: [Date] = []
    
    //MARK: Current Day
    @Published var currentDay: Date = Date()
    
    //MARK: Filtering Tpday Tasks
    @Published var filteredTasks: [Task]?
    
    //MARK: Inititializing
    init(){
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    // MARK: Filter Today Tasks
    func filterTodayTasks(){
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filtered = self.storedTasks.filter{
                return calendar.isDate($0.taskDate, inSameDayAs: self.currentDay)
            }
            
            DispatchQueue.main.async {
                withAnimation{
                    self.filteredTasks = filtered
                }
            }
        }
    }

        func fetchCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{
            return
        }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
                }
            }
        }
        
        //MARK: Extracting Date
    //i added --> String even though it isn't in the video
    func extractDate(date: Date,format: String)-> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
// MARK: Checking if current date is today
    func isToday(date: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
}
