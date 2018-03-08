//
//  DetailsVC.swift
//  MSSearch
//
//  Created by Macbook Pro on 2/7/2560 BE.
//  Copyright © 2560 Student. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var moviename: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var movietype: UILabel!
    
    var RecievedCellInfo : ListInfo!
    
    @IBAction func BackBT(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        print(RecievedCellInfo)
        
        moviename.text = RecievedCellInfo.title
        year.text = RecievedCellInfo.year
        movietype.text = RecievedCellInfo.type
        
        let url = URL(string: self.RecievedCellInfo._poster)!
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync{
                    self.poster.image = UIImage(data: data)
                }
            }
            catch{
                
                }
        }
        
        // Do any additional setup after loading the view.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
