//
//  ViewController.swift
//  pickImageView
//
//  Created by YU on 2019/2/19.
//  Copyright © 2019 ameyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    var imageView = UIImageView()
    @IBAction func pickView(_ sender: UIButton) {
        
      
        
    }
 
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as! UIImage
        imageView.image = image
        imageView.contentMode = .center
        
        myScrollView.contentSize = image.size
        
        let scrollViewFrame = myScrollView.frame
        let scrollWidth = scrollViewFrame.size.width / myScrollView.contentSize.width
        let scrollHeight = scrollViewFrame.size.height / myScrollView.contentSize.height
        let minScale = min(scrollHeight,scrollHeight)
        
        //設定比例限制、實作協定的類別
        myScrollView.minimumZoomScale = minScale
        myScrollView.maximumZoomScale = 1
        myScrollView.zoomScale = minScale
        
        picker.dismiss(animated: true, completion: nil)
        //print("圖片資訊", info)
        }
    //縮放計算
    func centerScrollView() {
    
        let boundsSize = myScrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2
        } else {
            contentsFrame.origin.x = 0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2
        } else {
            contentsFrame.origin.y = 0
        }
        
        imageView.frame = contentsFrame
        
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollView()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myScrollView.delegate = self
        
        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        imageView.image = UIImage(named: "icon_photo")
        //imageView.isUserInteractionEnabled = true
        //imageView.contentMode = .center
        myScrollView.addSubview(imageView)

        //測試點擊讀取相簿
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loadImage))
        tapGestureRecognizer.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func loadImage(recognizer: UITapGestureRecognizer) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary

        self.present(image, animated: true)

    }

}

