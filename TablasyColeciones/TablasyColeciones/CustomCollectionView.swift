//
//  CustomCollectionView.swift
//  TablasyColeciones
//
//  Created by JUAN on 5/01/18.
//  Copyright © 2018 net.juanfrancisco.blog. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class CustomCollectionView: UIViewController {

    var dataSource : [Persona] = [Persona]()




    /*
     var gender=""
     var email=""
     var phone=""
     var cell=""
     var valid=false
     var last_name=""
     var image=""
     */
    @IBOutlet weak var collectionView: UICollectionView!

    var operationQueue : OperationQueue!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        //self.dataSource = ["Jua","Francisco","Mosquera"]


            // Background Task

            for _ in 0...500 {
                DispatchQueue.main.async {
                Consumir.getSomeBody() { persons in

                    if let persons  = persons
                    {
                        let custom_person=persons[0]
                        self.dataSource.append(custom_person)

                        print (custom_person.toString())

                        DispatchQueue.main.async {
                            // App will crash
                            print ("vamos a recargar el tableview , el valor del array es \(self.dataSource.count)")
                            self.collectionView.reloadData()

                        }

                    }

                    print ("finalizo el for")
                    }
                }}






        self.collectionView.alwaysBounceVertical = true

    }
}

extension CustomCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        //casteamos la celda en la posicion X , a un tipo Gamecell , el cual debe tener los atributos mapeados desdel el historyboard
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell

        let persona = dataSource[indexPath.row]
        cell.lblNombre.text=persona.full_name()
        cell.lblGenero.text=persona.gender
        cell.lblTelefono.text=persona.phone
        cell.lblCorreo.text=persona.email
        cell.imagen.kf.setImage(with: ImageResource(downloadURL: URL(string: persona.image)!), placeholder: #imageLiteral(resourceName: "615aHtK2x5L"), options: nil, progressBlock: nil, completionHandler: nil)

        /*
         let game = lstGames[indexPath.row]

         cell.lblTitle.text = game.title

         var highlightColor = #colorLiteral(red: 0.9058823529, green: 0.2980392157, blue: 0.2352941176, alpha: 1)
         if !game.borrowed {
         highlightColor = #colorLiteral(red: 0.2039215686, green: 0.5960784314, blue: 0.8588235294, alpha: 1)


         }
         // para setear texto con color en una posicion x, interpolacion con cadenasa y operador ternario
         // adicional a esto , le seteamos el color que se definio en l paso anteior
         cell.lblBorrowed.attributedText = self.formatColours(string: "PRESTADO: \(game.borrowed ? "SI" : "NO")", color: highlightColor)


         // si esta prestado , tomamos a aqui esta prestado
         if let borrowedTo = game.borrowedTo
         {
         cell.lblBorrowedTo.attributedText = self.formatColours(string: "A: \(borrowedTo)", color: highlightColor)
         }
         else {
         cell.lblBorrowedTo.attributedText = self.formatColours(string: "A: --", color: highlightColor)
         }

         if let borrowedDate = game.borrowedDate {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd/MM/yyyy"
         cell.lblBorrowedDate.attributedText = self.formatColours(string: "FECHA: \(dateFormatter.string(from: borrowedDate))", color: highlightColor)
         } else {
         cell.lblBorrowedDate.attributedText = self.formatColours(string: "FECHA: --", color: highlightColor)
         }

         if let image = game.image  {
         cell.imageView.image = UIImage(data: image)
         }
         */
        /*
        cell.layer.masksToBounds = false // no embuela los bordes
        cell.layer.shadowOffset = CGSize(width: 1, height: 1) // de cuanto queremos la sombra
        cell.layer.shadowColor = UIColor.black.cgColor // queremos que sea black
        cell.layer.shadowRadius = 2.0 // de cuanto sera la sombra
        cell.layer.shadowOpacity = 0.2 // cuan transparenete sera
        */
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /*
         if lstGames.count == 0
         {
         let imageView = UIImageView(image: UIImage(named: "img_empty_screen"))
         imageView.contentMode = .center
         collectionView.backgroundView = imageView
         }
         else
         {
         collectionView.backgroundView = UIView()
         }
         */
        return self.dataSource.count

    }

    // como van  a manjear el ancho de cada celdas
    /*
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     // el ancho de la celda menos 20 puntos
     return CGSize(width: self.view.frame.size.width - 20, height: 120.0)
     }
     */


}
