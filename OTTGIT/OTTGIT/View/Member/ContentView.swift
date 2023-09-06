//
//  ContentView.swift
//  OTTGIT
//
//  Created by KimSungSik on 2023/09/05.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.state == .signedIn {
                MainView()
            } else {
                SignUpView()
            }
        }
        .onAppear {
            if Auth.auth().currentUser != nil {
                viewModel.state = .signedIn
            }
        }
    }
}
