//
//  Cell2TableViewCell.swift
//  Network
//
//  Created by 张波 on 2018/8/16.
//  Copyright © 2018年 zhbnxm. All rights reserved.
//

import UIKit

class Cell2TableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        textView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension Cell2TableViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textView.isScrollEnabled = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.isScrollEnabled = false
        
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.isScrollEnabled = false
//        self.beginUpdates()
//        self.endUpdates()
        //        var sltRange = textView.selectedRange
        //        sltRange.length = 1
        //        sltRange.location -= 1
        //        textView.scrollRangeToVisible(sltRange)
        
        return true
    }
    
    
    
    
    
    
}
