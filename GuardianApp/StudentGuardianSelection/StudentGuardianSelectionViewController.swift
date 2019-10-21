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
}
