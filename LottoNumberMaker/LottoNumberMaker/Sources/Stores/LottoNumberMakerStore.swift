//
//  LottoNumberMakerStore.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import Foundation

final class LottoNumberMakerStore: Store {

    static let shared = LottoNumberMakerStore(dispatcher: .shared)

    private(set) var numbers: [Int] = []

    override func onDispatch(_ action: Action) {
        switch action {
        case let .newNumbers(numbers):
            self.numbers = numbers
        case .saveNumbers:
            break
        }

        emitChange()
    }

}
