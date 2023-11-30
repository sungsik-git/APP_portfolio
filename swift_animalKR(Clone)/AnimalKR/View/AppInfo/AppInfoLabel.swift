//
//  AppInfoLabel.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/17.
//

import SwiftUI

struct AppInfoLabel: View {
    
    //property
    let labelText: String
    let labelImage: String
    
    var body: some View {
        HStack{
            Text(labelText.uppercased())
                .fontWeight(.bold)
            
            Image(systemName: labelImage)
                .hTrailing()
        } //: HStack
    }
}

struct AppInfoLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoLabel(labelText: "AppInfoHead", labelImage: "gear")
    }
}
