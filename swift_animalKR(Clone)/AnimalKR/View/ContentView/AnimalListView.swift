//
//  AnimalListView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct AnimalListView: View {
    
    let animal: Animal
    
    var body: some View {
        HStack{
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack (spacing: 10){
                Text(animal.name)
                    .hLeading()
                    .font(.title)
                    .foregroundColor(.accentColor)
        
                Text(animal.headline)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(.trailing, 10)
            } //: VStack
        } //: HStack
    }
}

struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListView(animal: Animal.sampleAnimal)
    }
}
