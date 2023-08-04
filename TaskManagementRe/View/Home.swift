//
//  Home.swift
//  TaskManagementRe
//
//  Created by Nuha Mohamed on 8/3/23.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: lazy stack with pinned header
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders])  {
                
                Section {
                    
                    //MARK: Current Week View
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 10){
                            
                            ForEach(taskModel.currentWeek,id: \.self ){day in
                                
                                VStack(spacing:10){
                                    
                                    Text(taskModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size:15))
                                        .fontWeight(.semibold)
                                    
                                    Text(taskModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size:14))
                                        .fontWeight(.semibold)
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(taskModel.isToday(date: day) ? 1:0)
                                    
                                }
                                //MARK: Foreground Style
                                .foregroundStyle(taskModel.isToday(date: day) ? .primary : .secondary)
                                .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                                //MARK: Capsule Shape
                                .frame(width:45, height:90)
                                .background(
                                
                                    ZStack{
                                       // MARK: Matched Geometry Effect
                                        if taskModel.isToday(date: day) {
                                            Capsule()
                                                .fill(.black)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                    //Updating Current Day
                                    withAnimation{
                                        taskModel.currentDay = day
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    TasksView()
                    
                } header: {
                    HeaderView()
                }
        }
    }
}
    // MARK: Task View
    func TasksView()->some View{
        LazyVStack(spacing: 18){
            
            if let tasks = taskModel.filteredTasks{
                if tasks.isEmpty{
                    
                    Text("No tasks found !!")
                        .font(.system(size:16))
                        .fontWeight(.light)
                        .offset(y:100)
                }
                else{
                    ForEach(tasks){task in
                        TaskCardView(task: task)
                    }
                }
            }
            else{
                //MARK: Progress View
                ProgressView()
                    .offset(y: 100)
            }
        }
        .padding()
        .padding(.top)
        //MARK: Updating Tasks
        .onChange(of: taskModel.currentDay){ newValue in
            taskModel.filterTodayTasks()
        }
    }

    //MARK: Task Card View
    func TaskCardView(task: Task)->some View{
        HStack{
            VStack(spacing: 10){
                Circle()
                    .fill(.black)
                    .frame(width: 15, height: 15)
                    .background(
                    
                        Circle()
                            .stroke(.black,lineWidth: 1)
                            .padding(-3)
                    )
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
            }
        }
        .hLeading()
    }
    
    
    // MARK: header
    func HeaderView()->some View{
        
        HStack(spacing:10){
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(Date().formatted(date: . abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                Text("Today")
                    .font(.largeTitle.bold())
            }
            .hLeading()
            
            Button{
                
            } label: {
                
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
        }
        .padding()
        .background(Color.white)
        
        }
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// MARK: UI design Helper functions
extension View{
    
    func hLeading()->some View{
        self
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    func hTrailing()->some View{
        self
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    func hCenter()->some View{
        self
            .frame(maxWidth: .infinity,alignment: .center)
    }
    
   
}
