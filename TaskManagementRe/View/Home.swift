//
//  Home.swift
//  TaskManagementRe
//
//  Created by Nuha Mohamed on 8/3/23.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: lazy stack with pinned header
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders])  {
                
                Section {
                    
                    //MARK: Current Week View
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 10){
                            
                            ForEach(taskModel.currentWeek,id: \.self ){day in
                                
                               // EEE will return day as MON, TUE, ...
                                
                                Text(taskModel.extractDate(date: day, format: "EEE"))
                            }
                        }
                    }
                    
                } header: {
                    HeaderView()
                }
        }
    }
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
