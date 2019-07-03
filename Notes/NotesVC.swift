//
//  ViewController.swift
//  Notes
//
//  Created by Mac on 3/20/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit



class NotesVC: UIViewController  {
    
 @IBOutlet weak var tabela: UITableView!
    
    
    override func viewDidLoad() {
        
        
        setBackground()
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        
        if let items = Notes.defaluts.array(forKey: "NotesArray") as? [String] {
            notesArray = items
            tabela.reloadData()
        }
        
    }
 
    func setBackground() {
        let slika = UIImage(named: "background.jpg")
        let imageView = UIImageView(image: slika)
        tabela.backgroundView = imageView
        tabela.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    

    @IBAction func addNote(_ sender: Any) {
        let new = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = new.instantiateViewController(withIdentifier: "second")
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
extension NotesVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  notesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! DataCell
        cell.textCell.text = notesArray[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            notesArray.remove(at: indexPath.row)
            Notes.defaluts.set(notesArray, forKey: "NotesArray")
            tabela.reloadData()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedRow = [indexPath.row]
        var myString = ""
        _ = selectedRow.map{ myString = myString + "\($0)" }
        Notes.myInt = Int(myString)!
        
        
        
        
        print(Notes.myInt)
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ispis", sender: notesArray[indexPath.row])
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController {
            vc.segueData = (sender as? String)!
            
            
        }
        
        
        
        
    }

    
}
