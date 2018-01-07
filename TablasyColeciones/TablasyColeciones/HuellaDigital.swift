//
//  HuellaDigital.swift
//  TablasyColeciones
//
//  Created by JUAN on 7/01/18.
//  Copyright © 2018 net.juanfrancisco.blog. All rights reserved.
//

import UIKit
import LocalAuthentication
class HuellaDigital: UIViewController {

    @IBOutlet weak var verificacion: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func entrar(_ sender: UIButton)
    {

        let contexto  = LAContext()

        if contexto.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {

            contexto.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Identificate con tu huella dactilar", reply: { (status, error) in

                // si funciona bien , lo mandamos al banco , le autorizamos acceso al sharepreferences
                // dominamos el mundo , etc
                
                if status {
                    self.performSegue(withIdentifier: "entrar", sender: self)

                }else{


                    self.performSegue(withIdentifier: "errorhuella", sender: self)

                  /*  DispatchQueue.main.async
                        {
                            self.verificacion.text = "Acceso denegado \(error)"
                        }
 */
                }

            })

        }else{
            verificacion.text = "El dispositivo no soporta touchID"
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
