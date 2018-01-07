//
//  Persona.swift
//  LineadeComandosConceptosdeRed
//
//  Created by JUAN on 5/01/18.
//  Copyright © 2018 net.juanfrancisco.blog. All rights reserved.
//

import Foundation




class Persona {
    var gender=""
    var email=""
    var phone=""
    var cell=""
    var valid=false
    var last_name=""
    var image=""

    func full_name ()-> String{

        return "\(self.firts_name) \(self.last_name)"
    }
    var firts_name = "" {
        didSet {
            valid=true
        }
    }
        func toString()-> String {
            if self.firts_name==""
            {
                return "Objecto no seteado"
            }
        return "\(self.firts_name) - > \(self.last_name) -> \(self.image) "
        }



    }





