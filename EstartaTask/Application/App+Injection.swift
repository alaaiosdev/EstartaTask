//
//  App+Injection.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerAPIClient {_ in
        }
        registerServices()
        registerUseCases()
    }
}
