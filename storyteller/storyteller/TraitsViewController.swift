//
//  TraitsViewController.swift
//  storyteller
//
//  Created by EMRE KILINC on 29.04.2023.
//

import UIKit

class TraitsViewController: UIViewController {
    var childAge: Int?
    var traitsToImprove: [Int] = []  // 0: RESPECT 1:PATIENCE 2:SHARING
    let defaults = UserDefaults.standard
   
    @IBOutlet weak var respectButton: UIButton!
    @IBOutlet weak var patienceButton: UIButton!
    @IBOutlet weak var sharingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func respectSelected(_ sender: Any) {
        if(traitsToImprove.contains(0)){
            traitsToImprove = traitsToImprove.filter {$0 != 0}
            respectButton.backgroundColor = UIColor.white
            respectButton.tintColor = UIColor.systemBlue
           
        } else {
            traitsToImprove.append(0)
            respectButton.backgroundColor = UIColor.systemGreen
            respectButton.tintColor = UIColor.white
        }
       
    }
    
    @IBAction func patienceSelected(_ sender: Any) {
        if(traitsToImprove.contains(1)){
            traitsToImprove = traitsToImprove.filter {$0 != 1}
            patienceButton.backgroundColor = UIColor.white
            patienceButton.tintColor = UIColor.systemBlue
        } else {
            traitsToImprove.append(1)
            patienceButton.backgroundColor = UIColor.systemGreen
            patienceButton.tintColor = UIColor.white
        }
    }
    
    @IBAction func sharingSelected(_ sender: Any) {
        if(traitsToImprove.contains(2)){
            traitsToImprove = traitsToImprove.filter {$0 != 2}
            sharingButton.backgroundColor = UIColor.white
            sharingButton.tintColor = UIColor.systemBlue
        } else {
            traitsToImprove.append(2)
            sharingButton.backgroundColor = UIColor.systemGreen
            sharingButton.tintColor = UIColor.white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGenerate" {
            let generateController = segue.destination as! GenerateViewController
            generateController.childAge = self.childAge
            generateController.traitsToImprove = self.traitsToImprove
        }
    }
    
    @IBAction func continueToGenerate(_ sender: Any) {
        performSegue(withIdentifier: "toGenerate", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
