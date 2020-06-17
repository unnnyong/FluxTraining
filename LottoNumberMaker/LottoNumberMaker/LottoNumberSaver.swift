//
//  LottoNumberSaver.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import Foundation

struct LottoNumberSaver {

    static let shared = LottoNumberSaver()

    private let key = "LottoNumbers"
    private var currentSavedNumbers: [[Int]] {
        get { UserDefaults.standard.array(forKey: key) as? [[Int]] ?? [] }
    }

    func save(currentNumbers: [Int]) {
        let savingNumbers: [[Int]] = [currentNumbers] + currentSavedNumbers
        UserDefaults.standard.set(savingNumbers, forKey: key)
    }

}
