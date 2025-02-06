//
//  HomeViewModel.swift
//  Tyle
//
//  Created by Vitoria Garcia on 27/1/25.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var hometype: HomeType = .all
    enum HomeType: String, CaseIterable, Identifiable {
        case all
        case following
        var id: Self { self }
    }
}

