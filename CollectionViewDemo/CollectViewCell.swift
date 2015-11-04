//
//  CollectViewCell.swift
//  CollectionViewDemo
//
//  Created by yunjoy on 15/11/4.
//  Copyright © 2015年 yunjoy. All rights reserved.
//

import UIKit

class CollectViewCell: UIView {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("initframe")
        NSBundle.mainBundle().loadNibNamed("CollectViewCell", owner: self, options: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("initcoder")
        //fatalError("init(coder:) has not been implemented")
       
    }
*/

}
