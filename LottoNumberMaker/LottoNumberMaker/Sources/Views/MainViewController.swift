//
//  MainViewController.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import UIKit

final class MainViewController: UITabBarController {

    private let lottoNumberMakerVC: LottoNumberMakerViewController = {
        UIStoryboard(
            name: "LottoNumberMakerViewController",
            bundle: nil
        ).instantiateViewController(identifier: "LottoNumberMakerViewController") as! LottoNumberMakerViewController
    }()

    private let SavedLottoNumberListVC: SavedLottoNumberListViewController = {
        UIStoryboard(
            name: "SavedLottoNumberListViewController",
            bundle: nil
        ).instantiateViewController(identifier: "SavedLottoNumberListViewController") as! SavedLottoNumberListViewController
    }()

    private let makerVCTabBarItem = UITabBarItem(
        title: "Make numbers",
        image: UIImage(systemName: "square.and.pencil"),
        tag: 0
    )
    private let savedNumberTabBarItem = UITabBarItem(
        title: "Saved numbers",
        image: UIImage(systemName: "folder"),
        tag: 1
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [lottoNumberMakerVC, SavedLottoNumberListVC]

        lottoNumberMakerVC.tabBarItem = makerVCTabBarItem
        SavedLottoNumberListVC.tabBarItem = savedNumberTabBarItem
    }

}
