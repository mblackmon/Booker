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
    
    static func changeSavedStatus(on book: Book, to newSaveStatus:Bool){
        let realm = RealmStack.realm
        try? realm.write {
            guard let fetchedBook = realm.object(ofType: Book.self, forPrimaryKey: book.givenKey) else { return }
            fetchedBook.isSaved = newSaveStatus
            realm.add(fetchedBook, update: true)
        }
    }
}


