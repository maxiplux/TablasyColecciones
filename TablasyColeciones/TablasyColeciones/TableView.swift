//
//  TableView.swift
//  TablasyColeciones
//
//  Created by JUAN on 5/01/18.
//  Copyright © 2018 net.juanfrancisco.blog. All rights reserved.
//

import UIKit

class TableView: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var datasource:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate=self
        self.tableview.dataSource=self
        self.datasource=["Jua","Francisco","Mosquera"]

        // Do any additional setup after loading the view.
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
 

extension TableView:UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  sigma=self.tableview.dequeueReusableCell(withIdentifier: "CellPersonalizada", for: indexPath ) as! CustomTableCell
        sigma.titulo.text=self.datasource[indexPath.row]
        return sigma
    }





}
