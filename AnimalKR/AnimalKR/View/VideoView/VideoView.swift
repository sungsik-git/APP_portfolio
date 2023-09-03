//
//  VideoView.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/15.
//

import SwiftUI

struct VideoView: View {
    
    @ObservedObject var vm: AnimalViewModel
    
    var body: some View {
        NavigationView {
            List{
                ForEach(vm.videos){ video in
                    NavigationLink{
                        // destination
                        VideoPlayerView(video: video)
                        
                    }label: {
                        VideoListItem(video: video)
                    } //: Navigation
                }
            } //: List
            .listStyle(.plain)
            .navigationBarTitle("비디오", displayMode: .inline)
        } //: Navigation
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(vm: AnimalViewModel())
    }
}
