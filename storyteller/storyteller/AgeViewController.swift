//
//  AgeViewController.swift
//  storyteller
//
//  Created by EMRE KILINC on 29.04.2023.
//

import UIKit

class AgeViewController: UIViewController {
    
    var childAge: Int?
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func threeYearsOldSelected(_ sender: Any) {
        childAge = 3
        defaults.set(childAge, forKey: "age")
        performSegue(withIdentifier: "toTraits", sender: nil)

    }

    @IBAction func fourYearsOldSelected(_ sender: Any) {
        childAge = 4
        defaults.set(childAge, forKey: "age")
        performSegue(withIdentifier: "toTraits", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTraits" {
            if let _childAge = childAge {
                let traitsController = segue.destination as! TraitsViewController
                traitsController.childAge = _childAge
            }
        }
    }
    

}
