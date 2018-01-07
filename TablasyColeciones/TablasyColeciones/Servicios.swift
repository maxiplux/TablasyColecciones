//
//  Servicios.swift
//  LineadeComandosConceptosdeRed
//
//  Created by JUAN on 5/01/18.
//  Copyright © 2018 net.juanfrancisco.blog. All rights reserved.
//

import Foundation


import SwiftyJSON
import Alamofire

class Consumir{

    static func getPerson() -> Persona
    {
        var person=Persona()
        Consumir.getSomeBody() { persons in

            if let persons  = persons
            {
                person=persons[0]
                print ("Valor ejecutado \(person.toString())")
            }
        }
        return person

    }


    static func getSomeBody(completionHandler: @escaping ([Persona]?) -> Void)
    {
        let url = URL(string: "https://randomuser.me/api/")



        Alamofire.request(url!, method: .get).validate().responseJSON() { response in

            switch response.result {
            case .success:
                if let value = response.result.value {

                    let json = JSON(value)

                    var result = [Persona]()

                    let entries = json["results"].arrayValue

                    for entry in entries {
                        let services_person = Persona()
                        //var real_movie=Movie()

                        services_person.gender = entry["gender"].stringValue
                        services_person.firts_name = entry["name"]["first"].stringValue
                        services_person.last_name = entry["name"]["last"].stringValue
                        services_person.image = entry["picture"]["large"].stringValue

                        services_person.phone = entry["phone"].stringValue
                        services_person.email = entry["email"].stringValue



                        result.append(services_person)

                    }

                    completionHandler(result)
                }

            case .failure (let error):
                print(error)
                completionHandler(nil)
            }

        }

    }
}

