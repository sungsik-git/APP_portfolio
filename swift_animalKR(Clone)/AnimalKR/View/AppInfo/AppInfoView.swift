//
//  AppInfoView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack (spacing: 20){
                    
                    //Apploaction
                    GroupBox {
                        AppInfoContent(name: "Developer" ,content: "Jocob Ko")
                        AppInfoContent(name: "compatibility", content: "iOS14.0")
                        AppInfoContent(name: "version", content: "1.0.0")
                        AppInfoContent(name: "website", linkLabel: "Jacob's DevLog", linkDestination:
                        "jacobko.info")
                        AppInfoContent(name: "Github", linkLabel: "Go to Repository", linkDestination:
                        "www.naver.com")
                    } label: {
                        AppInfoLabel(labelText: "Application", labelImage: "apps.iphone")
                    }
                    .padding(.vertical)
                    
                    
                    //copyright
                    GroupBox {
                        Divider().padding(.vertical, 5)
                        HStack{
                            Image("copyright")
                                .resizable()
                                .scaledToFit()
                                .frame(width: CGFloat.screenWidth * 0.3)
                            Text("test")
                                .font(.footnote)
                                .hTrailing()
                        } //: HStack
                        Divider().padding(.vertical, 5)
                        
                        
                    } label: {
                        AppInfoLabel(labelText: "Copyright", labelImage: "c.circle")
                    }

                } //: VStack
                .padding()
            } //: ScrollView
            .navigationBarTitle("앱 정보")
        } //: Navigation
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
