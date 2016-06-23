//
//  Przepis+CoreDataProperties.swift
//  przepizy
//
//  Created by Kamil Wójcik on 06.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Przepis {

    @NSManaged var image: NSData?
    @NSManaged var skladniki: String?
    @NSManaged var sposobPrzygotowania: String?
    @NSManaged var tytul: String?

}
