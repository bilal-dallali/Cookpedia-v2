//
//  UserSession.swift
//  Cookpedia
//
//  Created by Bilal Dallali on 12/11/2024.
//

import Foundation
import SwiftData

@Model
class UserSession: Identifiable {
    
    @Attribute(.unique) var userId: String
    @Attribute(.unique) var email: String
    var authToken: String
    var isRemembered: Bool
    
    init(userId: String, email: String, authToken: String, isRemembered: Bool) {
        self.userId = userId
        self.email = email
        self.authToken = authToken
        self.isRemembered = isRemembered
    }
}
