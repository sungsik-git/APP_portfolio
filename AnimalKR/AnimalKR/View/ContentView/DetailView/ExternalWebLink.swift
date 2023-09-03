//
//  ExternalWebLink.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct ExternalWebLink: View {
    
    var animal: Animal
    
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("멸종 위기 야생동물 포털")
                
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: (URL(string: animal.link)!)) {
                        Text(animal.name)
                    }
                    .foregroundColor(.accentColor)
                }  //: Group
            } //: HStack
        } //: GroupBox
    }
}

struct ExternalWebLink_Previews: PreviewProvider {
    static var previews: some View {
        ExternalWebLink(animal: Animal.sampleAnimal)
    }
}
