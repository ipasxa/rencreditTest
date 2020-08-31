//
//  DetailViewController.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 28.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberLabel: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = saveButton.frame.size.height / 2
        saveButton.backgroundColor = #colorLiteral(red: 0, green: 0.8544971447, blue: 0.1058380588, alpha: 1)
        saveButton.isEnabled = false
        
        if let note = note {
            nameTextField.text = note.name
            numberLabel.text = "\(note.number)"
        }
    }
    
    @IBAction func nameTextFieldChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    func save() {
        let newNote = Note()
        newNote.name = nameTextField?.text ?? ""
        newNote.number = Int(numberLabel.text ?? "") ?? 0
        
        if note != nil {
            note?.update(updatedNote: newNote)
        } else {
            newNote.save()
            note = newNote
        }
        
    }
    
    private func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }
    
}

extension DetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
