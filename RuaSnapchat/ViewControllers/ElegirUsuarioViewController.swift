//
//  ElegirUsuarioViewController.swift
//  RuaSnapchat
//
//  Created by Mac 11 on 7/06/23.
//

import UIKit
import FirebaseDatabase

class ElegirUsuarioViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    var usuarios:[Usuario]=[]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let usuario = usuarios[indexPath.row]
        cell.textLabel?.text = usuario.email
        return cell
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        listaUsuarios.delegate=self
        listaUsuarios.dataSource=self
        Database.database().reference().child("usuarios").observe(DataEventType.childAdded, with: { (snapshot) in
            print(snapshot)
            
            let usuario = Usuario()
            usuario.email=(snapshot.value as! NSDictionary)["email" ] as! String
            usuario.uid = snapshot.key
            self.usuarios.append(usuario)
            self.listaUsuarios.reloadData()
        })
    }

    @IBOutlet weak var listaUsuarios: UITableView!
}
