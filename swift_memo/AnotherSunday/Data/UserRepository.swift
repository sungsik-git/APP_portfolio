//
//  UserRepository.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/19.
//

import CoreData

class UserModel: UserModel{
    var userName: String = ""
    var insertDate: Date = Date()
    
    init(userName: String, insertDate: Date) {
        self.userName = userName
        self.insertDate = insertDate
    }
}

class UserRepository: UserStore {
    
    
    func add(userName: String, insertDate: Date) {
        <#code#>
    }
    
    func remove(id: String, insertDate: Date) {
        <#code#>
    }
    
    func removeAll() {
        <#code#>
    }
    
    func count() -> Int? {
        <#code#>
    }
    
    func removeLast() {
        <#code#>
    }
    
}
