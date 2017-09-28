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
    var year: String?
    var address: String?
    var founderPicture: UIImage?
    var spouse: String?
    
    init(firstName: String, lastName: String, fullName: String?, preferredName: String, phone:String,
         email: String?, bio: String?, status: String?, year: String?, address: String?,
         image: UIImage, spouse: String?) {
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
        self.spouse = spouse
    }
    
    public func getSpouseId() -> Int? {
        if (spouse == nil)
        {
            return nil
        }
        for (id, person) in DirectoryData.sharedInstance.foundersData {
            if (spouse == person.fullName)
            {
                return id
            }
        }
        return nil
    }
}
