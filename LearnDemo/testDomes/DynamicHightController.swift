//
//  DynamicHightController.swift
//  Network
//
//  Created by 张波 on 2018/8/16.
//  Copyright © 2018年 zhbnxm. All rights reserved.
//

import UIKit

class DynamicHightController: UIViewController {
    lazy var tableView: DynamicHightTableView = {
        var rect = self.view.bounds
        rect.origin.y = 80
        rect.size.height = rect.size.height - 80
        let tempView = DynamicHightTableView.init(frame: rect, style: UITableViewStyle.plain)
        return tempView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(self.tableView)
        let gst = UISwipeGestureRecognizer.init(target: self, action: #selector(downSwipeGesture(_ :)))
        gst.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(gst)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func downSwipeGesture(_ gestrue: UISwipeGestureRecognizer) {
        guard let view = gestrue.view else {
            return
        }
        let location = gestrue.location(in: view)
        let locationY = location.y
        if locationY > 100 {
            return
        }
        self.dismiss(animated: true, completion: nil)
        
    }

}
