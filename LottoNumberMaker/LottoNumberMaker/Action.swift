//
//  Action.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import Foundation

//class Action {
//    let type: ActionType
//    let numbers: [Int]
//
//    init(type: ActionType, numbers: [Int]) {
//        self.type = type
//    }
//}
//
//final class NewNumberAction: Action {
//
//    let newNumbers: [Int]
//
//    init(newNumbers: [Int]) {
//        self.newNumbers = newNumbers
//
//        super.init(type: .newNumbers(newNumbers))
//    }
//
//}

enum Action {
    case newNumbers([Int])
    case saveNumbers
}

final class ActionCreator {

    private let dispatcher: Dispatcher = .shared

    private let numberMaker = LottoNumberMaker()
    private let numberSaver = LottoNumberSaver.shared

    func makeNewNumbers() {
        let newNumbers = numberMaker.make()
        dispatcher.dispatch(.newNumbers(newNumbers))
    }

    func saveNumbers(currentNumbers: [Int]) {
        numberSaver.save(currentNumbers: currentNumbers)
        dispatcher.dispatch(.saveNumbers)
    }

}
