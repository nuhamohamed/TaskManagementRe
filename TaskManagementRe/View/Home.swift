//
//  Home.swift
//  TaskManagementRe
//
//  Created by Nuha Mohamed on 8/3/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            //mark: lazy stacj wuth pinned header
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders])  {
                
                Section {
                } header: {
                    
                }
        }
    }
}
    // mark: header
    func HeaderView()->some View{
        
        HStack(spacing:10){
            
            Text(Date().formatted(date: . abbreviated, time: .omitted))
                .foregroundColor(.gray)
            Text("Today")
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
