//
//  HomeViewController.swift
//  Koloda_Example
//
//  Created by Dustyn Pressman-Zeind on 4/25/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var shoesButton: UIButton!
    @IBOutlet weak var clothesButton: UIButton!
    @IBOutlet weak var accessoriesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }
   
    @IBAction func shoesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "startgameSegue", sender: "shoes")
    }
    @IBAction func clothesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "startgameSegue", sender:"clothes"
        )
    }
    
    
    @IBAction func accessoriesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "startgameSegue", sender: "accessories")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
        if identifier == "startgameSegue" {
            
            if let dest = segue.destination as? BackgroundAnimationViewController {
                dest.category = sender as! String
                }
            
            
        
            }}
        
    }
    
    
    
    @IBAction func leaderboardsPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "leaderboardSegue", sender: self)
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
        
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
