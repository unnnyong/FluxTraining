//
//  SavedLottoNumberListViewController.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import UIKit

final class SavedLottoNumberListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    private let store: SavedLottoNumberStore = .shared
    private let actionCreator = ActionCreator()

    private lazy var reloadSubscription: Subscription = {
        store.addListener { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }()

    private var savedNumbers: [[Int]] { store.savedNumbers }

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = reloadSubscription
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        actionCreator.loadSavedNumbers()
    }

}

// MARK:
extension SavedLottoNumberListViewController: UITableViewDelegate {}

// MARK:
extension SavedLottoNumberListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savedNumbers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = savedNumbers[indexPath.row]
            .map { "\($0)" }
            .joined(separator: "  ")

        return cell
    }

}
