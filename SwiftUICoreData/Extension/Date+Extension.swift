//
//  Date+Extension.swift
//  SwiftUICoreData
//
//  Created by Neosoft on 10/08/23.
//

import Foundation

extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let result = formatter.string(from: self)
        return result
    }
}
