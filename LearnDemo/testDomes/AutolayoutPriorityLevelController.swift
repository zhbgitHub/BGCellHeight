//
//  AutolayoutPriorityLevelController.swift
//  Network
//
//  Created by 张波 on 2018/8/15.
//  Copyright © 2018年 zhbnxm. All rights reserved.
//

import UIKit

class AutolayoutPriorityLevelController: UIViewController {
    @IBOutlet weak var vBtn1: UIButton!
    @IBOutlet weak var vBtn2: UIButton!
    @IBOutlet weak var vBtn3: UIButton!
    @IBOutlet weak var vBtn4: UIButton!
    
    @IBOutlet weak var hBtn1: UIButton!
    @IBOutlet weak var hBtn2: UIButton!
    @IBOutlet weak var hBtn3: UIButton!
    @IBOutlet weak var hBtn4: UIButton!
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let gst = UISwipeGestureRecognizer.init(target: self, action: #selector(downSwipeGesture(_ :)))
        gst.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(gst)

    }
    /// vBtn4距vBtn3 = vBtn3距vBtn2 > vBtn3距vBtn1 > vBtn4距vBtn2 > vBtn4距vBtn1
    @IBAction func didRemoveVBtn2(_ sender: Any) {
        if let btn = self.vBtn2 {
            btn.removeFromSuperview()
        }
    }
    
    @IBAction func didRemoveVBtn3(_ sender: Any) {
        if let btn = self.vBtn3  {
            btn.removeFromSuperview()
        }
    }
    
    @IBAction func didRemoveHBtn2(_ sender: Any) {
        if let btn = self.hBtn2  {
            btn.removeFromSuperview()
        }
    }
    @IBAction func didRemoveHBtn3(_ sender: Any) {
        if let btn = self.hBtn3  {
            btn.removeFromSuperview()
        }
    }
    /// 要点：
    // - 1.leftLb距supView.Left固定，rightLb距supView.right固定，
    // - 2.rightLb.left距leftLb.right不能固定，必须是greaterEqual
    // - 3.设置leftLb的‘抗压缩优先级’低于rightLb
    //
    //
    //--- Content Hugging Priority: 抗被拉伸的优先级。优先级越高，越不容易被拉伸，默认是251。
    //--- Content Compression Resistance Priority: 抗压缩的优先级。优先级越高，越不容易被压缩，默认是750
    @IBAction func didChangeLabelsText(_ sender: Any) {
        self.leftLabel.text = "🌹🌹🌹🌹hello world! This is leftLabel."
        self.rightLabel.text = "rightLabel."
    }
    
    /// 要点：
    // - 1. bottomLabel.superview 设置left、right、bottom约束
    // - 2. 设置bottom.top/left/bottom/right 等于superview
    // - 这是superview会根据label的text改变而改变高度。。
    @IBAction func didChangeBottomLabelText(_ sender: Any) {
        self.bottomLabel.text = "🌹🌹🌹🌹hello world! This is bottomLabel.Automatically increase the height value.🌹🌹🌹🌹ello world! This is bottomLabel.Automatically increase the height value."
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
