//
//  ViewController.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func viewSavedPressed(_ sender: Any) {
        let savedVC = BookListViewController()
        savedVC.searchFilter = SearchSelection.SavedSelection
        navigationController?.pushViewController(savedVC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

