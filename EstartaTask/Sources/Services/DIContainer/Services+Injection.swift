//
//  Services+Injection.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation
import Resolver

public extension Resolver {
    static func registerServices() {
        register { APIProductServices() as ProductService }
    }
}
