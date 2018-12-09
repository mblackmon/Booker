//
//  NetworkCoordinator.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

enum NetworkCoordinator {
    
    private static let searchBooksEndpoint = "http://openlibrary.org/search.json"
    
    static func fetchBooks(with selections: SearchSelection){
        guard var components = URLComponents(string: searchBooksEndpoint) else { return }
        //for now, don't do a search without any parameters
        guard selections.asQueryItems != nil else { return }
        let session = URLSession.shared //in a real app, we'd probably customized this
        
        components.queryItems = selections.asQueryItems
        guard let url = components.url else { return }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            guard let json = data, error == nil else {
                assertionFailure("unhandled network condition")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let searchResponse = try? decoder.decode(SearchJSONResponse.self, from: json) else {
                debugPrint(#file, "could not parse JSON")
                return
            }
            let realm = RealmStack.realm
            try? realm.write {
                searchResponse.docs.forEach { bookJSON in
                    if let existingBook = realm.object(ofType: Book.self, forPrimaryKey: bookJSON.key) {
                        existingBook.update(from: bookJSON)
                        realm.add(existingBook, update: true)
                    } else {
                        let newBook = Book(from: bookJSON)
                        realm.add(newBook)
                    }
                }
            }
        }
        task.resume()
    }
    
}
