//
//  SearchSelection.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

struct SearchSelection {
    private var title: String?
    private var author: String?
    
    init?(name: String?, author: String?) {
        guard name != nil || author != nil else { return nil }
        self.title = name
        self.author = author
    }
    
    var asQueryItems: [URLQueryItem]? {
        get {
            var items = [URLQueryItem]()
            if let author = author, author.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
                items.append(URLQueryItem(name: "author", value: author))
            }
            if let title = title, title.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
                items.append(URLQueryItem(name: "title", value: title))
            }
            return items.count == 0 ? nil : items
        }
    }
    
    var asPredicate: NSPredicate? {
        get {
            var predicates = [NSPredicate]()
            if let title = title, title.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
                predicates.append(NSPredicate(format: "name == %@", title))
            }
            if let author = author, author.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
                //TODO this is wrong, need set semantics 
                predicates.append(NSPredicate(format: "author == %@", author))
            }
            return predicates.count == 0 ? nil : NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        }
    }
}
