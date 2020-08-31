//
//  ListViewController.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 27.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {
    
    let dataFetcher = DbDataFetcher()
    var notes: Results<Note>!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: DataTableViewCell.reuseId)
        tableView.separatorStyle = .none
        addButton.backgroundColor = #colorLiteral(red: 0, green: 0.8544971447, blue: 0.1058380588, alpha: 1)
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        
        definesPresentationContext = true
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "addNew", sender: sender)
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let detailViewController = segue.source as? DetailViewController else {
            print("Incorrect segue source")
            return
        }
        
        detailViewController.save()
        tableView.reloadData()
    }
    
    // MARK: - NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            guard let indexPath = tableView.indexPathForSelectedRow else {
                print("incorrect index path of selected row")
                return
            }
            guard let detailVC = segue.destination as? DetailViewController else {
                print("Incorrect destination view controller")
                return
            }
            
            detailVC.note = notes[indexPath.row]
        }
    }
    
}

// MARK: - Table view data source & delegate

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.reuseId, for: indexPath) as! DataTableViewCell
        let cellData = notes[indexPath.row]
        cell.set(model: cellData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        note.delete()
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
