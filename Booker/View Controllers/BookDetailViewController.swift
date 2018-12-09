//
//  BookDetailViewController.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, BookPresenter {

    func refreshUI(){
        guard let book = lastPresentedBook else { return }
        titleLabel?.text = book.name
        authorLabel?.text = book.author
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }
    
    fileprivate var lastPresentedBook: Book?
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var authorLabel: UILabel?
    @IBOutlet private weak var saveButton: UIButton?
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
    }
    
    func present(_ book: Book) {
        lastPresentedBook = book
        refreshUI()
    }
}

//extension BookListViewController: BookPresenter {
//    func present(_ book: Book) {
//        lastPresentedBook = book
//        updateUI()
//    }
//}
