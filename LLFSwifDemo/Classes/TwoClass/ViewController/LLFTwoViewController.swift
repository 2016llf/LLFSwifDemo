//
//  LLFTwoViewController.swift
//  LLFSwifDemo
//
//  Created by 帮啦跑腿 on 2019/3/13.
//  Copyright © 2019 刘龙飞. All rights reserved.
//

import UIKit

class LLFTwoViewController: LLFBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    // MARK - Lazy Load
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5;//设置最小行间距
        layout.minimumInteritemSpacing = 10;//同一列中间隔的cell最小间距
        layout.itemSize = CGSize.init(width: (KScreenWidth-50)/4, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
        let collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - KNavigationBarHeight - KBottomBarHeight), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "LLFCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LLFCollectionViewCell")
        collectionView.backgroundColor = UIColor.red
        return collectionView
    }()
    
    // MARK - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.collectionView)
    }
    
    // MARK - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:LLFCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LLFCollectionViewCell", for: indexPath) as! LLFCollectionViewCell
        cell.ttttt.isOn = false
        return cell
    }
    
    // MARK - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}
