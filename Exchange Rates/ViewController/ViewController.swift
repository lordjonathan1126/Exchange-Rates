//
//  ViewController.swift
//  Exchange Rates
//
//  Created by Jonathan Ng on 16/03/2021.
//

import UIKit
import Combine

class ViewController: UITableViewController {
    
    var webService = WebService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webService.getRates()
    }
    
    

}

