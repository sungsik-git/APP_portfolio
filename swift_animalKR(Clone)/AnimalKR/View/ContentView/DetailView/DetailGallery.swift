//
//  DetailGallery.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct DetailGallery: View {
    
    var animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }//: HStack
        } //: ScrollView
    }
}

struct DetailGallery_Previews: PreviewProvider {
    static var previews: some View {
        DetailGallery(animal: Animal.sampleAnimal)
    }
}
