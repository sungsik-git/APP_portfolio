//
//  DetailFact.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct DetailFact: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self){ item in
                    Text(item)
                }
            } //: Tab
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

struct DetailFact_Previews: PreviewProvider {
    static var previews: some View {
        DetailFact(animal: Animal.sampleAnimal)
    }
}
