//
//  Cell1TableViewCell.swift
//  Network
//
//  Created by 张波 on 2018/8/16.
//  Copyright © 2018年 zhbnxm. All rights reserved.
//

import UIKit

class Cell1TableViewCell: UITableViewCell {

    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var evaluateButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
