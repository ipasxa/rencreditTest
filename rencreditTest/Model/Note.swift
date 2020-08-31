//
//  Note.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 31.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import RealmSwift

class Note: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var number = 0
    
    static var notes = [Note]()
    
    func delete() {
        RealmStorageManger.deleteObject(self)
    }
    
    func save() {
        RealmStorageManger.saveObject(self)
    }
    
    func update(updatedNote: Note) {
        RealmStorageManger.updateObject(self, with: updatedNote)
    }
    
}
