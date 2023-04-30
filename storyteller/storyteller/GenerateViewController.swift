//
//  GenerateViewController.swift
//  storyteller
//
//  Created by EMRE KILINC on 29.04.2023.
//

import UIKit
import FirebaseFirestore

class GenerateViewController: UIViewController {
    var childAge: Int?
    var traitsToImprove: [Int] = []  // 0: RESPECT 1:PATIENCE 2:SHARING
        
    let database = Firestore.firestore()
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(childAge ?? 11)
        print(traitsToImprove)
        // Do any additional setup after loading the view.
    }
    @IBAction func generateClicked(_ sender: Any) {
        getCorrectStory()
        
    }
    
    func getCorrectStory() {
        let sortedList = traitsToImprove.sorted()
        let traits = sortedList.map({ String($0) }).joined(separator: "")
       
        let docRef = database.document("stories/\(childAge!)")
        docRef.getDocument { [self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            text = data[traits] as? String
            performSegue(withIdentifier: "toStory", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStory" {
            let storyController = segue.destination as! StoryEntryViewController
            storyController.text = self.text
        }
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
