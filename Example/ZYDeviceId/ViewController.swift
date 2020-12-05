//
//  ViewController.swift
//  ZYDeviceId
//
//  Created by RiotParticipants on 12/05/2020.
//  Copyright (c) 2020 RiotParticipants. All rights reserved.
//

import UIKit
import ZYDeviceId

class ViewController: UIViewController {

    @IBOutlet weak var lblDeviceId: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fetchId(_ sender: Any) {
        self.lblDeviceId.text = ZYDeviceId.shared.currentID()
    }
}

