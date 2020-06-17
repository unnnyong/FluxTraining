//
//  LottoNumberMakerViewController.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import UIKit

final class LottoNumberMakerViewController: UIViewController {

    @IBOutlet private weak var numbersLabel: UILabel!

    private let store: LottoNumberMakerStore = .shared
    private let actionCreator = ActionCreator()

    private lazy var reloadSubscription: Subscription = {
        store.addListener { [weak self] in
            DispatchQueue.main.async {
                self?.updateLabel()
            }
        }
    }()

    private var numbers: [Int] { store.numbers }

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = reloadSubscription
    }

}

// MARK: IBAction
private extension LottoNumberMakerViewController {

    @IBAction func didTapMakeLottoNumbers(_ sender: UIButton) {
        actionCreator.makeNewNumbers()
    }

    @IBAction func didTapSaveLottoNumbers(_ sender: UIButton) {
        actionCreator.saveNumbers(currentNumbers: numbers)
    }

}

// MARK: Private method
private extension LottoNumberMakerViewController {

    func updateLabel() {
        let numbersText = numbers
            .map { "\($0)" }
            .joined(separator: "  ")

        numbersLabel.text = numbersText
    }

}
