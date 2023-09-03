//
//  DetailView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct DetailView: View {
    
    var animal: Animal
    
    var body: some View {
        ScrollView{
            VStack (spacing: 20){
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.vertical, 10)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 25)
                    )
                
                Text(animal.headline)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding()
                
                Group{
                    DetailHead(headingImage: "photo.on.rectangle.angled", headingText: "\(animal.name) 사진들")
                    
                    DetailGallery(animal: animal)
                } //: Group
                
                Group{
                    DetailHead(headingImage: "info.circle", headingText: "자세한 정보")
                    
                    Text(animal.description)
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                } //: Group
                
                Group{
                    DetailHead(headingImage: "location.magnifyingglass", headingText: "펙트체크")
                    DetailFact(animal: animal)
                } //: Group
                
                Group{
                    DetailHead(headingImage: "books.vertical", headingText: "참고 자료")
                    
                    ExternalWebLink(animal: animal)
                } //: Group
                
                Text(animal.copyright)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                
            } //: VStack
            .navigationBarTitle("\(animal.name) 자세히 알아보기", displayMode: .inline)
        } //: ScrollView
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(animal: Animal.sampleAnimal)
    }
}
