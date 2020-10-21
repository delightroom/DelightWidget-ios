//
//  DetailViewController.swift
//  DelightWidget
//
//  Created by smis on 2020/10/21.
//

import UIKit

class DetailViewController: UIViewController {

    var emojiDetails: EmojiDetails?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let emojiDetails = self.emojiDetails else { return }
        self.titleLabel.text = "\(emojiDetails.emoji)\n\(emojiDetails.name)"
        self.descriptionTextView.text = emojiDetails.description
    }
}
