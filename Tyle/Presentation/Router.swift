//
//  Router.swift
//  Tyle
//
//  Created by Vitoria Garcia on 23/1/25.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    public enum Destination: Codable, Hashable {
        case login
        case signup
        case tab
    }
    @Published var path = NavigationPath()
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func navigateTo(_ destination: Destination) {
        path.append(destination)
    }
    
}
