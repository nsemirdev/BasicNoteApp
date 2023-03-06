//
//  Validations.swift
//  BasicNoteApp
//
//  Created by Emir Alkal on 6.03.2023.
//

import Foundation

struct Validate {
    static func fullNameTextField(str: String) -> Bool {
        if str.isEmpty || str.count > 255 { return false }
        return true
    }
    
    static func emailTextField(str: String) -> Bool {
        if str.isEmpty { return false }
        
        let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let range = NSRange(location: 0, length: str.utf16.count)
        if regex?.firstMatch(in: str, options: [], range: range) == nil {
            return false
        }
        return true
    }
    
    static func passwordTextField(str: String) -> Bool {
        if str.isEmpty || str.count < 6 || str.count > 255 { return false }
        return true
    }
}
