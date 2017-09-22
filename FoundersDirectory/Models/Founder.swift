//
//  Founders.swift
//  FoundersDirectory
//
//  Created by Victor Lazaro on 9/21/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import Foundation

class Founder {
    
    var firstName: String?
    var lastName: String?
    var fullName: String?
    var preferredName: String?
    var phone: String?
    var email: String?
    var bio: String?
    var status: String?
    var year: Int?
    var address: String?
    var founderPicture: UIImage?
    
    init(firstName: String, lastName: String, fullName: String?, preferredName: String, phone:String,
         email: String?, bio: String?, status: String?, year: Int?, address: String?,
         image: UIImage) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
        self.preferredName = preferredName
        self.phone = phone
        self.email = email
        self.bio = bio
        self.status = status
        self.year = year
        self.address = address
        self.founderPicture = image
    }
}
