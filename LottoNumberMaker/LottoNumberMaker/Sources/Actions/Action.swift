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
