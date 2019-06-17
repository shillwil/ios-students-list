//
//  Student.swift
//  Students
//
//  Created by Andrew R Madsen on 8/5/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String
    var course: String
    
    var firstname: String {
        // What this doing is saying take the string object contained in name, cut it up into an array of individual strings and divide them every time a space is in between, then the brackets are saying return this element in the array
        return String(name.split(separator: " ")[0])
    }
    
    var lastName: String {
        return String(name.split(separator: " ").last ?? "")
    }
}
