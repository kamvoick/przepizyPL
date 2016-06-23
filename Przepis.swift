//
//  Przepis.swift
//  przepizy
//
//  Created by Kamil Wójcik on 06.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Przepis: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    
    func ustawZdjeciePrzepisu(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func wezZdjeciePrzepisu() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
}
