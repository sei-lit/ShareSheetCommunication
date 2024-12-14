//
//  ViewController.swift
//  ShareSheetCommunication
//
//  Created by 大森青 on 2024/12/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var goodButton: UIButton!
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var textFeild: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        goodButton.layer.cornerRadius = 10
        moreButton.layer.cornerRadius = 10

    }
    
    @IBAction func didTapGoodButton(_ sender: Any) {
        label.text = "Good"
    }
    
    @IBAction func didTapMoreButton(_ sender: Any) {
        label.text = "More"
    }
    
    @IBAction func didTapShareButton(_ sender: Any) {
        let feedbackType = label.text?.lowercased()
        let feedbackText = encodeJapaneseString(text: textView.text!)
        let sender = encodeJapaneseString(text: textFeild.text!)
        
        let shareURL = "goochalle://\(sender ?? "")/\(feedbackText ?? "")?type=\(feedbackType ?? "")"
        
        shareSheet(shareText: shareURL)
    }
    
    func shareSheet(shareText: String) {

      let controller = UIActivityViewController(
        activityItems: [shareText],
        applicationActivities: nil
      )
      
      self.present(controller, animated: true, completion: nil)
    }
    
    func encodeJapaneseString(text: String) -> String? {
        let encodingText = text.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        return encodingText
    }


}


