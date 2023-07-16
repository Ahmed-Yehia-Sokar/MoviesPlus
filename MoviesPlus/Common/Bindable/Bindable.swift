//
//  Bindable.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

class Bindable<T> {
    // MARK: - properties
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    var observer: ((T?) -> ())?

    // MARK: - public methods
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
