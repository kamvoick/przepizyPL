//
//  dodajPrzepisVC.swift
//  przepizy
//
//  Created by Kamil Wójcik on 07.06.2016.
//  Copyright © 2016 Kamil Wójcik. All rights reserved.
//

import UIKit
import CoreData

class dodajPrzepisVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var tytulPrzepisuField: UITextField!
    @IBOutlet weak var skladnikiField: UITextField!
    @IBOutlet weak var sposobPrzygotowaniaField: UITextField!
    @IBOutlet weak var zdjeciePrzepisu: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        zdjeciePrzepisu.layer.cornerRadius = zdjeciePrzepisu.frame.width/2
        zdjeciePrzepisu.clipsToBounds = true
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        zdjeciePrzepisu.image = image
    }


    @IBAction func dodajZdjecieBtn(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func stworzPrzepisBtn(sender: AnyObject) {
        if let tytul = tytulPrzepisuField.text where tytul != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Przepis", inManagedObjectContext: context)!
            let przepis = Przepis(entity: entity, insertIntoManagedObjectContext: context)
            przepis.tytul = tytul
            przepis.skladniki = skladnikiField.text
            przepis.sposobPrzygotowania = sposobPrzygotowaniaField.text
            przepis.ustawZdjeciePrzepisu(zdjeciePrzepisu.image!)//! zakładamy że będzie zdjecie
            
            context.insertObject(przepis)
            
            //wszystko co teraz fruwa w powietrzu /\ musimy zapisać bo wywali błąd
            do{
                try context.save()
            }catch{ //w przeciwnym wypadku wyłapiemy błędy
                print("Nie można zapisać przepisu")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
