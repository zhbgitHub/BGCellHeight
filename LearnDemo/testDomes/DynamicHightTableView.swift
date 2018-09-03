//
//  DynamicHightTableView.swift
//  Network
//
//  Created by 张波 on 2018/8/16.
//  Copyright © 2018年 zhbnxm. All rights reserved.
//

import UIKit

let cell1Identifier = "cell1"
let cell2Identifier = "cell2"

class DynamicHightTableView: UITableView {
    lazy var tempCell1: Cell1TableViewCell = {
        return self.dequeueReusableCell(withIdentifier: cell1Identifier) as! Cell1TableViewCell
    }()
    
    
    lazy var cell1TextArray: [String] = {
        var tempArray: [String] = Array.init(repeating: "hello", count: 30)
        for i in 0..<30 {
            if i % 5 == 0 {
                tempArray[i] = "🌹hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!hello world!🌹"
            }
            if i % 5 == 1 {
                tempArray[i] = "🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹🌹"
            }
        }
        return tempArray
    }()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: UITableViewStyle.plain)
        self.backgroundColor = .yellow
        self.keyboardDismissMode = .onDrag
        let cell1Nib = UINib(nibName: "Cell1TableViewCell", bundle: nil)
        let cell2Nib = UINib(nibName: "Cell2TableViewCell", bundle: nil)
        self.register(cell1Nib, forCellReuseIdentifier: cell1Identifier)
        self.register(cell2Nib, forCellReuseIdentifier: cell2Identifier)
        self.dataSource = self
        self.delegate = self
        self.estimatedRowHeight = 200
        self.rowHeight = UITableViewAutomaticDimension
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension DynamicHightTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cell1TextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell2Identifier, for: indexPath) as! Cell2TableViewCell
        cell.textView.delegate = self;
        cell.textView.text = self.cell1TextArray[indexPath.row]
        cell.textView.isScrollEnabled = false
        cell.textView.tag = 800 + indexPath.row
        return cell
    }
    
    
}

extension DynamicHightTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension DynamicHightTableView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.beginUpdates()
        self.endUpdates()
        var sltRange = textView.selectedRange
        sltRange.length = 1
        sltRange.location -= 1
        textView.scrollRangeToVisible(sltRange)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.isScrollEnabled = false
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.isScrollEnabled = true
        let tag = textView.tag - 800
        let index = (tag % self.cell1TextArray.count)
        self.cell1TextArray[index] = textView.text
    }
}
