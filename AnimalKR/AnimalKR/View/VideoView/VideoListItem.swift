//
//  VideoListItem.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/16.
//

import SwiftUI

struct VideoListItem: View {
    
    let video: Video
    
    var body: some View {
        HStack (spacing: 10){
            ZStack{
                Image(video.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90,height: 90)
                    .cornerRadius(10)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 5)
            } //: ZStack
            
            VStack (spacing: 10){
                Text(video.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                    .hLeading()
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VStack
            
        } //: HStack
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItem(video: Video.sampleVideoData)
    }
}
