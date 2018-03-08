//
//  ListTableViewController.swift
//  MSSearch
//
//  Created by Macbook Pro on 2/7/2560 BE.
//  Copyright © 2560 Student. All rights reserved.
//

import UIKit
import Alamofire

class ListTableViewController: UITableViewController{
    

    @IBAction func BackBT(_ sender: Any) {
//        movies = []
//        tableView.reloadData()
        SearchText.sharedInstance.searchText = ""
        
        
        dismiss(animated: true, completion: nil)
    }
   
    var movies = [ListInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print ("hi")
        tableView.delegate = self//deleting
        tableView.dataSource = self//adding data/rows in a table
        self.downloadMovieData {

            
        }
    }
    
    func downloadMovieData(completed : @escaping () -> ())  {
        movies.removeAll()
        tableView.reloadData()
        
     //   print("\(BASE_URL)\(SearchText.sharedInstance.searchText!)\(APP_ID)\(KEY)")
        Alamofire.request("\(BASE_URL)\(SearchText.sharedInstance.searchText!)\(APP_ID)\(KEY)").responseJSON { response in
            
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject >{
                if let movies = dict["Search"] as? [Dictionary<String, AnyObject> ] {
                    for movie in movies {
                        let m = ListInfo(movieDict: movie)
                        self.movies.append(m)
                        
                    }
                }
                self.tableView.reloadData()
            }
           
            completed()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListTableViewCell{
            let list = movies[indexPath.row]
            cell.configureCell(listinfo: list)
            return cell
        }else{
            return ListTableViewCell()
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detail_Page", sender: movies[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsVC{
//            if let video = sender as? VideoModel{
//                destination.video = video
            destination.RecievedCellInfo = sender as! ListInfo!
            
        }
    }
    

    
    

}
