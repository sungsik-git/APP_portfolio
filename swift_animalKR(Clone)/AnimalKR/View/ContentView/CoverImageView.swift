//
//  CoverImageView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct CoverImageView: View {
    
    @ObservedObject var vm: AnimalViewModel
    
    var body: some View {
        TabView{
            ForEach(vm.coverImages) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            } //: Loop
        } //: Tab
        .tabViewStyle(.page)
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View { 
        CoverImageView(vm: AnimalViewModel())
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
