//
//  TweetViewController.swift
//  Twitter
//
//  Created by Tatum Allen on 3/10/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TweetBox.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func tweet(_ sender: Any) {
        if(!TweetBox.text.isEmpty)
        {
            TwitterAPICaller.client?.postTweet(tweetString: TweetBox.text, success: { self.dismiss(animated: true, completion: nil)
            }, failure: {(error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBOutlet weak var TweetBox: UITextView!
    

}
