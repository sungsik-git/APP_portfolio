//
//  VideoPlayerView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/16.
//

import SwiftUI

struct VideoPlayerView: View {
    
    let video: Video
    
    var body: some View {
        NavigationView {
            YoutubeView(videoID: video.videoid)
        } //: Navigation
        .navigationBarTitle("\(video.name)", displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: Video.sampleVideoData)
    }
}
