//
//  UserStore.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/19.
//

import CoreData

public protocol UserModel {
    var userName: String { get }
    var insertDate: Date { get }
}

public protocol UserStore{
    func add(userName: String, insertDate: Date)
    func remove(id: String, insertDate: Date)
    func removeAll()
    func count() -> Int?
    func removeLast()
}
