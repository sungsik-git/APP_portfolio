//
//  HomeView.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/18.
//

import SwiftUI

struct HomeView: View {
    
    @State var name: String = ""
    
    var body: some View {
            VStack{
                
                //Name Input Group
                HStack{
                    Text("이름 : ")
                    
                    TextField("Enter Your Name", text: $name)
                        .padding()
                        .background(Color(uiColor: .secondarySystemGroupedBackground))
                        .border(.blue)
                } //: HStack
                .padding()
            } //: VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
