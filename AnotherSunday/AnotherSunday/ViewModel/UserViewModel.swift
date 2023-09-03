//
//  ViewModel.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/22.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class UserInfo: ObservableObject{
    @Published var users: [User] = []
    @Published var changeCount: Int = 0
    @Published var hasLoadedData: Bool = false
    
    //Realtime Database 기본경로 저장
    let ref: DatabaseReference? = Database.database().reference()
    
    //JSON형태 데이터 처리용
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    //데이터 변경 관찰함수
    func listenToRealtimeDatabase(){
        guard !hasLoadedData else{
            return
        }
        
        
        guard let databasePath = ref?.child("users") else {
            return
        }
        
        //아이템 추가시 읽어오는 함수
        databasePath
            .observe(.childAdded) { [weak self] snapshot, _ in
                guard
                    let self = self,
                    let json = snapshot.value as? [String: Any]
                else {
                    return
                }
                do {
                    let userInfo = try JSONSerialization.data(withJSONObject: json)
                    let user = try self.decoder.decode(User.self, from: userInfo)
                    self.users.append(user)
                }catch{
                    print("an error occurred", error)
                }
            }
            
        //수정된 아이템이 있을 경우 읽어오는 함수
        databasePath
            .observe(.childChanged) { [weak self] Snapshot, _ in
                guard
                    let self = self,
                    let json = Snapshot.value as? [String: Any]
                else{
                    return
                }
                do{
                    let userInfo = try JSONSerialization.data(withJSONObject: json)
                    let user = try self.decoder.decode(User.self, from: userInfo)
                    
                    var index = 0
                    for userItem in self.users {
                        if (user.id == userItem.id){
                            break
                        }else{
                            index += 1
                        }
                    }
                    self.users[index] = user
                }catch{
                    print("an error occurred", error)
                }
            }
        //삭제된 아이템이 있을 경우 읽어오는 함수
        databasePath
            .observe(.childRemoved) { [weak self] Snapshot, _ in
                guard
                    let self = self,
                    let json = Snapshot.value as? [String: Any]
                else{
                    return
                }
                do{
                    let userInfo = try JSONSerialization.data(withJSONObject: json)
                    let user = try self.decoder.decode(User.self, from: userInfo)
                    for (index, userItem) in
                            self.users.enumerated() where user.id == userItem.id{
                                self.users.remove(at: index)
                            }
                }catch{
                    print("an error occurred", error)
                }
            }
        
        //경로의 모든 컨텐츠 변경 내용을 감지하고 읽어온다.
        databasePath
            .observe(.value) { [weak self] snapshot in
                guard
                    let self = self
                else{
                    return
                }
                self.changeCount += 1
                self.hasLoadedData = true
                }
    } //: Function
    
    func stopListening() {
        ref?.removeAllObservers()
    }
    
    func addNewInfo(user: User){
        self.ref?.child("users").child("\(user.id)").setValue([
            "id": user.id,
            "name" : user.name,
            "phone" : user.phone,
        ])
    } //: Function
    
    func deleteInfo(key: String) {
        ref?.child("users/\(key)").removeValue()
    } //: Function
    
    func editInfo(user: User){
        let updates: [String : Any ] = [
            "id" : user.id,
            "name" : user.name,
            "phone" : user.phone,
         ]
        
        let childUpdate = ["user/\(user.id)": updates]
        for (index, userItem) in users.enumerated() where userItem.id == user.id {
            users[index] = user
        }
        self.ref?.updateChildValues(childUpdate)
    } //: Function
}

