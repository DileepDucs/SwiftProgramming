//
//  CustomTViewCell.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 16/01/22.
//

import UIKit

class CustomTViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCellContent(search: Search?) {
        nameLabel.text = search?.name
        languageLabel.text = search?.language
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
