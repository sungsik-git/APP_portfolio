//
//  EditInfoView.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/26.
//

import SwiftUI

struct EditInfoView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var vm: UserInfo
    @State var name: String = ""
    @State var phone: String = ""
    @State var showAlert: Bool = false
    @Binding var selectedInfo: User
    @Binding var isOnEditInfoView: Bool
    
    
    var body: some View {
        NavigationView {
            VStack{
                
                Image("LogoImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
                    .padding()
                
                DataInput(title: "Name", userInput: $selectedInfo.name)
                DataInput(title: "Phone", userInput: $selectedInfo.phone)
                
                HStack {
                    Spacer()
                    
                    Button("Cancel", action: {
                        mode.wrappedValue.dismiss()
                    })
                    .foregroundColor(.red)
                    
                    Spacer()
                    
                    Button {
                        let editInfo = User(
                            id: selectedInfo.id,
                            name: selectedInfo.name,
                            phone: selectedInfo.phone
                        )
                        vm.editInfo(user: editInfo)
                        
                        name = name
                        phone = phone
                        
                        showAlert = true
                    } label: {
                        Text("Edit")
                    }
                    
                    Spacer()
                    
                    .alert(isPresented: $showAlert){
                        Alert(title: Text("Message Sent"), message: Text("Change Your Info"),
                              dismissButton: .default(Text("OK")){
                            mode.wrappedValue.dismiss()
                        })
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct EditInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditInfoView(vm: UserInfo(), selectedInfo: .constant(User(id: "", name: "name", phone: "phone")), isOnEditInfoView: .constant(true))
    }
}
