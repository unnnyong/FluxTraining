//
//  Store.swift
//  LottoNumberMaker
//
//  Created by Eunyeong Kim on 2020/06/17.
//  Copyright © 2020 Eunyeong Kim. All rights reserved.
//

import Foundation

typealias Subscription = NSObjectProtocol

class Store {

    private enum NotificationName {
        static let storeChaged = Notification.Name(rawValue: "store-chaged")
    }

    private let notificationCenter = NotificationCenter()

    private let dispatcher: Dispatcher
    private lazy var dispatchToken: DispatchToken = dispatcher.register { [weak self] action in
        self?.onDispatch(action)
    }

    init(dispatcher: Dispatcher) {
        self.dispatcher = dispatcher
        _ = dispatchToken
    }

    func onDispatch(_ action: Action) {
        fatalError("must override")
    }

}

// MARK: final method
extension Store {

    final func emitChange() {
        notificationCenter.post(name: NotificationName.storeChaged, object: nil)
    }

    final func addListener(callback: @escaping () -> ()) -> Subscription {
        let using: (Notification) -> () = { notification in
            if notification.name == NotificationName.storeChaged { callback() }
        }

        return notificationCenter.addObserver(
            forName: NotificationName.storeChaged,
            object: nil,
            queue: nil,
            using: using
        )
    }

    final func removeListener(_ subscription: Subscription) {
        notificationCenter.removeObserver(subscription)
    }

}
