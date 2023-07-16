//
//  DictionaryExtension.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

extension Dictionary {
    func getString(_ key: Key, defaultValue: String = "") -> String {
        if let value = self[key] as? String {
            return value
        }
        
        return defaultValue
    }
    
    func getInt(_ key: Key, defaultValue: Int = 0) -> Int {
        if let value = self[key] as? Int {
            return value
        }
        
        return defaultValue
    }
    
    func getArray(_ key: Key, defaultValue: [Any] = []) -> [Any] {
        if let value = self[key] as? [Any] {
            return value
        }
        
        return defaultValue
    }
}
