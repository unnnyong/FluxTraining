//
//  LottoNumberMaker.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import Foundation

struct LottoNumberMaker {

    func make() -> [Int] {
        var numbers: [Int] = []

        while numbers.count < 6 {
            let newNum = Int.random(in: 0...45)

            if !numbers.contains(newNum) {
                numbers.append(newNum)
            }
        }

        return numbers
    }

}
