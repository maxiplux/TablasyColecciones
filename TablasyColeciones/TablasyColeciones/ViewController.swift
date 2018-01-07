//
//  ViewController.swift
//  TablasyColeciones
//
//  Created by JUAN on 5/01/18.
//  Copyright © 2018 net.juanfrancisco.blog. All rights reserved.
//

import UIKit

import SCLAlertView
import Proposer

class ViewController: UIViewController {


    @IBAction func choosePhoto() {
        return 
        let photos: PrivateResource = .photos
        let propose: Propose = {
            proposeToAccess(photos, agreed: {
                print("I can access Photos. :]\n")
                if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = .savedPhotosAlbum
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }, rejected: {
                self.alertNoPermissionToAccess(photos)
            })
        }
        self.showProposeMessageIfNeedFor(photos, andTryPropose: propose)
    }

    @IBOutlet weak var datoInicial: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.



        Consumir.getSomeBody() { persons in

            if let persons  = persons
            {

                //print(persons[0].toString()+"soy el objecto basico desde ios")

                self.datoInicial.text=persons[0].toString()


                SCLAlertView().showError("Hello Error", subTitle: "This is a more descriptive error text.",closeButtonTitle:"Listo") // Error
                SCLAlertView().showNotice("Hello Notice", subTitle: "This is a more descriptive notice text.",closeButtonTitle:"Listo")// Notice
                SCLAlertView().showWarning("Hello Warning", subTitle: "This is a more descriptive warning text.",closeButtonTitle:"Listo") // Warning
                SCLAlertView().showInfo("Hello Info", subTitle: "This is a more descriptive info text.",closeButtonTitle:"Listo" )// Info
                SCLAlertView().showEdit("Hello Edit", subTitle: "This is a more descriptive info text.",closeButtonTitle:"Listo") // Edit
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

