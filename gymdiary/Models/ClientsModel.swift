//
//  File.swift
//  gymdiary
//
//  Created by c.toan on 04.08.2023.
//

import UIKit

class ClientsModel {
    let firstName, lastName, aboutClient: String
    let age: Int
    let image: UIImage?
    
    init(firstName: String, lastName: String, aboutClient: String, age: Int, image: UIImage) {
        self.firstName = firstName
        self.lastName = lastName
        self.aboutClient = aboutClient
        self.age = age
        self.image = image
    }
}
