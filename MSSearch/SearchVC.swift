//
//  ViewController.swift
//  MSSearch
//
//  Created by Macbook Pro on 2/3/2560 BE.
//  Copyright © 2560 Student. All rights reserved.
//

import UIKit
import Alamofire

class SearchVC: UIViewController {
var movielist = [ListInfo]()
    @IBOutlet weak var myInput: UITextField!
    
    @IBAction func SearchBT(_ sender: Any) {
        
        performSegue(withIdentifier: "list_table", sender: myInput.text)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            SearchText.sharedInstance.searchText = sender as! String
    }
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        
    }

}

