//
//  DetailView.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/26.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var vm: UserInfo
    @State private var isOnEditInfoView: Bool = false
    @State var selectedInfo: User
    
    var body: some View {
        Form {
            Section(header: Text("User Detail")){
                Text("ID : " + selectedInfo.id)
                    .font(.headline)
                Text("Name : " + selectedInfo.name)
                    .font(.body)
                Text("Phone : " + selectedInfo.phone)
                    .font(.body)
                
                Button {
                    vm.deleteInfo(key: selectedInfo.id)
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Text("Delete Info")
                        .foregroundColor(Color.red)
                }

                NavigationLink{
                    // destination
                    EditInfoView(vm: vm, selectedInfo: $selectedInfo, isOnEditInfoView: $isOnEditInfoView)
                } label: {
                    Text("Edit Info")
                        .foregroundColor(Color.blue)
                }
            } //: Section
            .padding()
        } //: Form
        .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(vm: UserInfo(), selectedInfo: User(id: "", name: "name", phone: "phone"))
    }
}
