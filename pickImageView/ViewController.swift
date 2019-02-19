//
//  ViewController.swift
//  pickImageView
//
//  Created by YU on 2019/2/19.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    
    let image = UIImagePickerController()
    
    @IBAction func pickView(_ sender: UIButton) {
       
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(image, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            myImageView.image = image
        } else {
        
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         //myImageView.image = image
    }

}

