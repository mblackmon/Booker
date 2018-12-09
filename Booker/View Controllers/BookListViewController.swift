//
//  BookListViewController.swift
//  Booker
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import RealmSwift

class BookListViewController: UIViewController {

    //MARK: Public variables
    var searchFilter: SearchSelection? {
        didSet {
            guard let predicate = searchFilter?.asPredicate else {
                results = RealmStack.realm.objects(Book.self)
                return
            }
            results = RealmStack.realm.objects(Book.self).filter(predicate)
        }
    }
    
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: Data & Data Fetching
    private var notificationToken: NotificationToken!
    fileprivate var results = RealmStack.realm.objects(Book.self) {
        didSet {
            onMain { [weak self] in
                self?.notificationToken = self?.results.observe({ changes in
                    //TODO better UI by selective data inserting
                    self?.tableView.reloadData()
                })
            }
        }
    }
    
    //MARK: UI setup and variables
    private func setupUI(){
        view.addSubview(tableView)
        tableView.pin(to: view)
    }
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        return tv
    }()
}

//MARK: - TableViewDataSource Conformance
extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = results[indexPath.row]
        //FIXME: Reuse a tablecell
        let cell = UITableViewCell()
        cell.textLabel?.text = book.name
        return cell
    }
}
