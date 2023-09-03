//
//  AppInfoContent.swift
//  AnimalKR
//
//  Created by KimSungSik on 2023/08/17.
//

import SwiftUI

struct AppInfoContent: View {
    
    //property
    var name: String
    //optional property
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    
    var body: some View {
        VStack{
            Divider()
                .padding(.vertical, 5)
            
            HStack{
                Text(name)
                    .foregroundColor(.gray)
                
                if (content != nil){
                    // 1. name, content only
                    Text(content ?? "noValue")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .hTrailing()
                } else if (linkLabel != nil && linkDestination != nil){
                    // any LinkLabel, LinkDestination
                    Link(
                        destination: URL(string: "http//\(linkDestination!)")!){
                            
                            Spacer()
                            
                            Text(linkLabel!)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                        }
                    Image(systemName: "arrow.up.right.square").foregroundColor(.accentColor)
                } else {
                    EmptyView()
                }
            } //: HStack
        } //: VStack
    }
}

struct AppInfoContent_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            AppInfoContent(name: "Sample", content: "Jacob Ko")
            AppInfoContent(name: "Sample2", linkLabel: "jacob's Blog", linkDestination: "jacobko.info")
        }
    }
}
