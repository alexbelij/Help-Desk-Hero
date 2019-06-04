//
//  AboutViewController.swift
//  HelpDeskHero
//
//  Created by Bailey Conradt on 6/4/19.
//  Copyright © 2019 Bailey Conradt. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var gameOverviewText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gameOverviewText.setContentOffset(CGPoint.zero, animated: false)
    }
    
}
