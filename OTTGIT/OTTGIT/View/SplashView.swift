//
//  MainView.swift
//  OTTGIT
//
//  Created by KimSungSik on 2023/09/05.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        HStack{
            Image("LOGO")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 180)
            
        } //: HStack
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
