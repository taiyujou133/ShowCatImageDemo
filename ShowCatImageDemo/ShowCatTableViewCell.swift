//
//  ShowCatTableViewCell.swift
//  ShowCatImageDemo
//
//  Created by Tai on 2022/10/20.
//

import UIKit

class ShowCatTableViewCell: UITableViewCell {

    @IBOutlet weak var showImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
