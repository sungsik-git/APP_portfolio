//
//  SplashView.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/18.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var vm: UserInfo = UserInfo()
    @State private var isAction: Bool = false
    @State private var size: Double = 0.5
    @State private var opacity: Double = 0.5
    
    var body: some View {
        if isAction {
            HomeView(vm: vm)
        }else{
            VStack{
                Image("LogoImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                
            } //: VStack
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeInOut(duration: 1.5)){
                    size = 1.0
                    opacity = 1.0
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        isAction = true
                    }
                }
            }
        } //: If
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
