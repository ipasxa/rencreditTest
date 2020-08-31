//
//  StorageManager.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 28.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

final class RealmStorageManger {
    
    static func saveObject(_ note: Note) {
        try! realm.write{
            realm.add(note)
        }
    }
    
    static func deleteObject(_ note: Note) {
        try! realm.write {
            realm.delete(note)
        }
    }
    
    static func updateObject(_ note: Note, with updatedNote: Note) {
        try! realm.write {
            note.name = updatedNote.name
            note.number = updatedNote.number
        }
    }
    
}
