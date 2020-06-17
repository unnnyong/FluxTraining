//
//  SavedLottoNumberStore.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import Foundation

final class SavedLottoNumberStore: Store {

    static let shared = SavedLottoNumberStore(dispatcher: .shared)

    private(set) var savedNumbers: [[Int]] = []

    override func onDispatch(_ action: Action) {
        switch action {
        case .loadSavedNumbers(let numbers):
            savedNumbers = numbers
        default:
            break
        }

        emitChange()
    }

}
