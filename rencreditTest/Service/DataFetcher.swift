//
//  DataFetcher.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 27.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import RealmSwift

final class DbDataFetcher {
    
    static func fetchData() -> Results<Note> {
        let realmNotes = realm.objects(Note.self)
        return realmNotes
    }
    
}
