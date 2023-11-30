//
//  ContentView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: AnimalViewModel
    
    var body: some View {
        NavigationView {
            List{
                // 1.Cover Image - hero Image
                CoverImageView(vm: vm)
                    .frame(height: CGFloat.screenHeight * 0.4)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                // Animal List
                ForEach(vm.animals) { animal in
                    NavigationLink{
                        DetailView(animal: animal)
                    }label: {
                        AnimalListView(animal: animal)
                            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                    }
                } //: Loop
                CreditView()
                    .hCenter()
            } //: List
            .listStyle(.plain)
            .navigationBarTitle("멸종위기 동물들")
        } //: Navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: AnimalViewModel())
    }
}
