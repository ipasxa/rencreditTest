//
//  DataLoadingViewController.swift
//  rencreditTest
//
//  Created by Pavel Mikhalev on 27.08.2020.
//  Copyright © 2020 Pavel Mikhalev. All rights reserved.
//

import UIKit
import RealmSwift

class DataLoadingViewController: UIViewController {
    
    private var notes: Results<Note>!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var goNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        goNextButton.isHidden = true
        activityIndicator.startAnimating()
        
        notes = DbDataFetcher.fetchData()
        
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.statusLabel.isHidden = true
        self.goNextButton.isHidden = false
    }
    
    @IBAction func goNextButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "DataLoadedSegue", sender: sender)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DataLoadedSegue" {
            
            guard let listVC = segue.destination as? ListViewController else {
                print("Incorrect destination view controller")
                return
            }
            
            listVC.notes = self.notes
        }
    }
    
}
