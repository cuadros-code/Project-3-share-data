//
//  DetailViewController.swift
//  Project-1
//
//  Created by Kevin Cuadros on 26/07/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    
    var selectedImage: String?
    var totalImages: Int = 0
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Imagen \(selectedIndex) of \(totalImages)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(sharedTapped)
        )
        
        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func sharedTapped() {
        
        guard let image = ImageView.image?.jpegData(compressionQuality: 0.8)
        else {
            print("Error shared image")
            return
        }
        
        let vc = UIActivityViewController(
            activityItems: [image, selectedImage ?? "Image name not found"],
            applicationActivities: []
        )
        
        // This line management the shared mode in Ipad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }

}
