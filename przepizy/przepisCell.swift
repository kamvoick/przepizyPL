//
//  przepisCell.swift
//  przepizy
//
//  Created by Kamil Wójcik on 06.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import UIKit

class przepisCell: UITableViewCell {

    
    @IBOutlet weak var obrazekPrzepisu: UIImageView!
    @IBOutlet weak var tytułPrzepisu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func skonfigurujKomorke(przepis: Przepis){
        obrazekPrzepisu.image = przepis.wezZdjeciePrzepisu()
        tytułPrzepisu.text = przepis.tytul
        obrazekPrzepisu.clipsToBounds = true
    }
}
