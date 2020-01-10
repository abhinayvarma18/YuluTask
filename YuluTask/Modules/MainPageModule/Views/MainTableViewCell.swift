//
//  MainTableViewCell.swift
//  YuluTask
//
//  Created by Abhinay Varma on 10/01/20.
//  Copyright © 2020 Abhinay Varma. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateDataWithModel(_ model:DataModel?) {
        titleLabel.text = model?.title ?? ""
        subtitleLabel.text = model?.subtitle ?? ""
    }
    
}
