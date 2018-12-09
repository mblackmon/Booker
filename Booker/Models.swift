//
//  Models.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import RealmSwift

class Book: Object {
    @objc dynamic var givenKey = ""
    @objc dynamic var name = ""
    //TODO make author a set, not just one value
    @objc dynamic var author = ""
    @objc dynamic var isSaved = false
    
    override static func primaryKey() -> String {
        return "givenKey"
    }
    
    static let noAuthorKey = "Unknown"
}

//MARK: Extension to interact with parsing
extension Book {
    convenience init(from parsed: ParsedBook) {
        self.init()
        givenKey = parsed.key
        name = parsed.titleSuggest
        author = ""
//        author = parsed.authorName.first ?? Book.noAuthorKey
        isSaved = false
    }
    
    func update(from parsed: ParsedBook){
        name = parsed.titleSuggest
        author = ""
//        author = parsed.authorName.first ?? Book.noAuthorKey
    }
}

struct ParsedBook: Decodable {
    let titleSuggest: String
    let key: String
//    let authorName: [String]
}

struct SearchJSONResponse: Decodable {
    let docs: [ParsedBook]
}
