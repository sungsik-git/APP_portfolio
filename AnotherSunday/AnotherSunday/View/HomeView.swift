//
//  HomeView.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/18.
//

import SwiftUI


struct HomeView: View {
    
    @ObservedObject var vm : UserInfo
    @State var name: String = ""
    @State var phone: String = ""
    @State var isResultView = false
    @State var showAlert = false
    
    var body: some View {
        VStack{
            
            Image("LogoImage")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 120)
                .padding()
            
            
            Form {
                NavigationLink(destination: ContentView(vm:vm), label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward.fill")
                    Text("Check UserInfo")
                })
                
                Section(header: Text("Input Your Info")) {
                    DataInput(title: "Name", userInput: $name)
                    DataInput(title: "phone", userInput: $phone)
                }
            }
            
            Button{
                vm.addNewInfo(user: User(id: UUID().uuidString, name: name, phone: phone))
                name = ""
                phone = ""
                showAlert = true
            } label: {
            Text("Send Messege")
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("Message Sent"), message: Text("Will send message for you"))
            }
        } //: VStack
        .navigationBarBackButtonHidden()
    }
}

struct DataInput: View{
    
    var title: String
    @Binding var userInput: String
    
    var body: some View{
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } //: VStack
        .padding()
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(vm: UserInfo())
    }
}
