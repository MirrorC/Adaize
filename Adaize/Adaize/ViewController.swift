//
//  ViewController.swift
//  Adaize
//
//  Created by Zhichao Yang on 2016-03-25.
//  Copyright © 2016 Zhichao Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func choosePhoto(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.allowsEditing = true
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    @IBOutlet weak var profileImage: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.profileImage.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var previewView: UIView!
    
    @IBAction func saveImage(sender: AnyObject) {
        
        let imageToSave = UIImage(view: previewView)
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
    }

}


extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(CGImage: image.CGImage!)
    }
}

