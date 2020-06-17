//
//  Action.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import Foundation

enum Action {
    case newNumbers([Int])
    case saveNumbers
    case loadSavedNumbers([[Int]])
}

final class ActionCreator {

    private let dispatcher: Dispatcher = .shared

    private let numberMaker = LottoNumberMaker()
    private let numberSaver = LottoNumberSaver.shared

}

// MARK: LottoNumberMakerVC
extension ActionCreator {

    func makeNewNumbers() {
        let newNumbers = numberMaker.make()
        dispatcher.dispatch(.newNumbers(newNumbers))
    }

    func saveNumbers(currentNumbers: [Int]) {
        numberSaver.save(currentNumbers: currentNumbers)
        dispatcher.dispatch(.saveNumbers)
    }

}

// MARK: SavedLottoNumberListVC
extension ActionCreator {

    func loadSavedNumbers() {
        let loadedSavedNumbers = numberSaver.load()
        dispatcher.dispatch(.loadSavedNumbers(loadedSavedNumbers))
    }

}

