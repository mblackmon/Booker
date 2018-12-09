//
//  SearchStartViewController.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class SearchStartViewController: UIViewController {

    //MARK: User Actions
    @IBAction func searchPressed(_ sender: Any) {
        guard let selection = SearchSelection(name: titleField.text?.trimmingCharacters(in: .whitespacesAndNewlines), author: authorField.text?.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            //TODO make an alert
            return
        }
        NetworkCoordinator.fetchBooks(with: selection)
        let resultsVC = BookListViewController()
        resultsVC.searchFilter = selection
        navigationController?.pushViewController(resultsVC, animated: true)                
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet private weak var titleField: UITextField!
    @IBOutlet private weak var authorField: UITextField!
    
}
