//
//  UserInfoModel.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/23.
//

import Foundation
import Firebase

struct User: Codable, Identifiable, Hashable {
    
    var id: String
    var name: String
    var phone: String    
}
