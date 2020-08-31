//
//  Results + Array.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 31.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import RealmSwift

extension Results {
    
    func toArray() -> [Element] {
        return compactMap { $0 }
    }
    
}
