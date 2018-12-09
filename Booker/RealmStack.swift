//
//  RealmStack.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import RealmSwift

class RealmStack {
    
    //TODO better realm dispersion strategy 
    class var realm: Realm {
        return try! Realm()
    }
}


