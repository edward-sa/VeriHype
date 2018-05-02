//
//  ScoreViewController.swift
//  Koloda_Example
//
//  Created by Dustyn Pressman-Zeind on 4/29/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    var score = 0

    @IBOutlet weak var scoreLabel: UILabel!

    @IBAction func backbutton(_ sender: Any) {
        performSegue(withIdentifier: "scoretohomesegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let scoretext = String(score)
        scoreLabel.text =  scoretext + "/3"
        //scoreLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
