//
//  MainViewController.swift
//  DelightWidget
//
//  Created by smis on 2020/10/21.
//

import UIKit

class MainViewController: UITableViewController {

    private let emojiData = EmojiProvider.all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? DetailViewController, let item = sender as? EmojiDetails else { return }
        viewController.emojiDetails = item
        
    }

}

extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = emojiData[indexPath.row]
        cell.textLabel?.text = "\(item.emoji) \(item.name)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = emojiData[indexPath.row]
        self.performSegue(withIdentifier: "toDetail", sender: item)
    }
}
