//
//  StoryEntryViewController.swift
//  storyteller
//
//  Created by EMRE KILINC on 29.04.2023.
//

import UIKit

class StoryEntryViewController: UIViewController {
    var pageNumber = 0
    var text:String?

    @IBOutlet weak var storyText: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentPage()
    }
    
    fileprivate func getPopUp() {
        //            let blurEffect = UIBlurEffect(style:.systemUltraThinMaterial)
        //            let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //
        //            blurEffectView.frame = self.view.bounds
        //            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //            self.view.addSubview(blurEffectView)
        //            print("in")
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        let popupView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 260))
        popupView.center = view.center
        popupView.backgroundColor = .white
        popupView.layer.cornerRadius = 10
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: popupView.frame.width, height: 30))
        titleLabel.text = "Upgrade Required"
        titleLabel.textAlignment = .center
        popupView.addSubview(titleLabel)
        
        let descriptionLabel = UILabel(frame: CGRect(x: 20, y: titleLabel.frame.maxY + 10, width: popupView.frame.width - 40, height: 80))
        descriptionLabel.text = "To continue reading, please subscribe to our premium service."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        popupView.addSubview(descriptionLabel)
        
        let subscribeButton = UIButton(frame: CGRect(x: 0, y: popupView.frame.height - 110, width: popupView.frame.width, height: 50))
        subscribeButton.setTitle("Subscribe", for: .normal)
        subscribeButton.setTitleColor(.white, for: .normal)
        subscribeButton.backgroundColor = .systemBlue
        subscribeButton.layer.cornerRadius = 10
        subscribeButton.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
        popupView.addSubview(subscribeButton)
        
        let backButton = UIButton(frame: CGRect(x: 0, y: popupView.frame.height - 50, width: popupView.frame.width, height: 50))
        backButton.setTitle("Cancel", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .systemBlue
        backButton.layer.cornerRadius = 10
        backButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        popupView.addSubview(backButton)
        
        animateScaleIn(desiredView: popupView)
    }
    
    @IBAction func nextPageClicked(_ sender: Any) {
        if(pageNumber < 1){
            pageNumber += 1
            showCurrentPage()
        } else {
            getPopUp()
        }
    }
    
    @objc func subscribeButtonTapped() {
        // Handle subscribe button tapped action
    }
    
    @objc func cancelButtonTapped() {
        performSegue(withIdentifier: "goback", sender: nil)
        // Handle cancel button tapped action
        
    }
    
    func showCurrentPage() {
        guard let text = text else {
            return
        }
        let words = text.components(separatedBy: .whitespacesAndNewlines)
        let wordsPerPage = (words.count + 2) / 3 // round up to make sure all words fit in the pages
        let startIndex = pageNumber * wordsPerPage
        let endIndex = min(startIndex + wordsPerPage, words.count)
        let currentPageWords = Array(words[startIndex..<endIndex])
        let currentPageText = currentPageWords.joined(separator: " ")
        storyText.text = currentPageText
        print(currentPageText)
    }
    
    
    // Animates a view to scale in and display
    func animateScaleIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    
        UIView.animate(withDuration: 1.5) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        }
    }
}
