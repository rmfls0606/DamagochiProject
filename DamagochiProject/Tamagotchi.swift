//
//  Tamagotchi.swift
//  DamagochiProject
//
//  Created by 이상민 on 7/10/25.
//

import Foundation

enum UserDefaultKey: String{
    case name
    case level
    case rice
    case water
}

class Tamagotchi{
    @UserDefault(key: .name, defaultValue: "대장") var name: String
    @UserDefault(key: .level, defaultValue: 1) var level: Int
    @UserDefault(key: .rice, defaultValue: 0) var riceCount: Int
    @UserDefault(key: .water, defaultValue: 0) var waterCount: Int
}

@propertyWrapper
struct UserDefault<T>{
    let key: String
    let defaultValue: T
    let storage: UserDefaults
    
    init(key: UserDefaultKey, defaultValue: T, storage: UserDefaults = .standard) {
        self.key = key.rawValue
        self.defaultValue = defaultValue
        self.storage = storage
    }
    
    var wrappedValue: T{
        get{
            return storage.object(forKey: key) as? T ?? defaultValue
        }
        set(newValue){
            storage.set(newValue, forKey: key)
        }
    }
}
