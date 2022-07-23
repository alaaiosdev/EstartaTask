//
//  LoadingState.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation

public enum LoadingState {
    case idle
    case loading
    
    public var isIdle: Bool { self == .idle }
    public var isLoading: Bool { self == .loading }
    
    public mutating func toggle() {
        switch self {
        case .idle:
            self = .loading
            
        case .loading:
            self = .idle
        }
    }
}
