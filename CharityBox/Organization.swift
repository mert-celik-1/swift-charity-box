//
//  Organization.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import Foundation

class Organization:Codable{
    
    var id:String?
    var name:String?
    var shortName:String?
    var description:String?
    var accountNumber:String?
    var balance:Decimal?
    var photoUrl:String?
    
    
    init(id:String,name:String,shortName:String,description:String,accountNumber:String,photoUrl:String,balance:Decimal) {
        self.id=id
        self.name=name
        self.shortName=shortName
        self.description=description
        self.accountNumber=accountNumber
        self.balance=balance
        self.photoUrl=photoUrl
    }
    
    
    
}
