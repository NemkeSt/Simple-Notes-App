//
//  DrugiViewController.swift
//  Notes
//
//  Created by Mac on 3/20/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit



class AddNotesVC: UIViewController {
    
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setBackground()
        // Do any additional setup after loading the view.
        TekstNaDrugom.text = segueData
     
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "first")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        if TekstNaDrugom.text != "" {
            
            
            notesArray.insert(TekstNaDrugom.text, at: 0)
            
            Notes.defaluts.set(notesArray, forKey: "NotesArray")
            
            
        }
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "first")
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    @IBOutlet weak var TekstNaDrugom: UITextView!
    var segueData: String!
   
    
    func setBackground() {
        let image = UIImage(named: "background.jpg")
        TekstNaDrugom.backgroundColor = UIColor.init(patternImage: image!)
    }
    
    
  
    
    

}

    


