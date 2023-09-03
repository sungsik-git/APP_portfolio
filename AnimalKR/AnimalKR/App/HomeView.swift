//
//  HomeView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm: AnimalViewModel = AnimalViewModel()
    
    var body: some View {
        TabView{
            ContentView(vm: vm)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("홈")
                }
            VideoView(vm: vm)
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("비디오")
                }
            GalleryView(vm: vm)
                .tabItem {
                    Image(systemName: "photo")
                    Text("갤러리")
                }
            AppInfoView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("앱정보")
                }
        } //: Tab
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
