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
        debugPrint(#file, "search pressed")
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet private weak var titleField: UITextField!
    @IBOutlet private weak var authorField: UITextField!
    
}
