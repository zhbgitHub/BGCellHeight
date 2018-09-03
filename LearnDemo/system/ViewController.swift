//
//  ViewController.swift
//  LearnDemo
//
//  Created by 张波 on 2018/8/23.
//  Copyright © 2018年 张波. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clickedTwo(_ sender: Any) {
        print("TwoTwoTwoTwoTwo")
        let toVc = AutolayoutPriorityLevelController()
        self.present(toVc, animated: true, completion: nil)
        print("🌹🌹")
    }
    
    @IBAction func clickOne(_ sender: Any) {
        let toVc = DynamicHightController()
        self.present(toVc, animated: true, completion: nil)
        print("🌹")
    }

}

