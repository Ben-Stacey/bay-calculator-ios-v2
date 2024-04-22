//
//  User.swift
//  bay-calculator
//
//  Created by Ben Stacey on 22/04/24.
//

import Foundation
import SwiftData

@Model
class User {
    @Attribute(.unique) var id: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    
    init(id: String, firstName: String, lastName: String, email: String, password: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
