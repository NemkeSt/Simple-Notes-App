//
//  EditViewController.swift
//  Notes
//
//  Created by Mac on 7/3/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var segueData = ""
    @IBOutlet weak var editTextView: UITextView!
    
    @IBAction func done(_ sender: Any) {
        
        notesArray.insert(editTextView.text, at: 0)
        
        notesArray.remove(at: Notes.myInt)
        
        
        Notes.defaluts.set(notesArray, forKey: "NotesArray")
        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "first")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "first")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        editTextView.text = segueData
        // Do any additional setup after loading the view.
    }
    

    func setBackground() {
        let image = UIImage(named: "background.jpg")
        editTextView.backgroundColor = UIColor.init(patternImage: image!)
    }
    
    

}
