//
//  StudentGuardianSelectionViewController.swift
//  GuardianApp
//
//  Created by Alexander Stevens on 10/21/19.
//  Copyright © 2019 Alex Stevens. All rights reserved.
//

import UIKit

class StudentGuardianSelectionViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBAction func addNewPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ConfirmGuardian", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ConfirmGuardian")
        controller.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(StudentGuardianCollectionCell.self, forCellWithReuseIdentifier: "selection")
    }
}

extension StudentGuardianSelectionViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selection", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
}

extension StudentGuardianSelectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = 20
        return CGSize(width: (self.collectionView.frame.width / 2) - 20, height: (self.collectionView.frame.height / 2) - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ConfirmCheckIn", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ConfirmCheckIns")
        controller.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
