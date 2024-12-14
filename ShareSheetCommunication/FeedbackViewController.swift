//
//  FeedbackViewController.swift
//  ShareSheetCommunication
//
//  Created by 大森青 on 2024/12/14.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var feedbackTextLabel: UILabel!
    @IBOutlet weak var feedbackTypeLabel: UILabel!
    
    var sender: String = ""
    var feedbackText: String = ""
    var feedbackType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FeedbackViewController loaded")
        
        let decodedSender = sender.removingPercentEncoding ?? ""
        let decodedFeedbackText = feedbackText.removingPercentEncoding ?? ""
        
        senderLabel.text = "\(decodedSender)より"
        feedbackTextLabel.text = decodedFeedbackText
        
        if feedbackType == "good" {
            feedbackTypeLabel.backgroundColor = .systemYellow
            feedbackTypeLabel.text = "Good"
        } else if feedbackType == "more" {
            feedbackTypeLabel.backgroundColor = .systemGreen
            feedbackTypeLabel.text = "More"
        }
        
    }
    

}
