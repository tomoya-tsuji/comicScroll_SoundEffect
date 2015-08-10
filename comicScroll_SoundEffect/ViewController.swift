//
//  ViewController.swift
//  comicScroll_SoundEffect
//
//  Created by TsujiTomoya on 2015/07/28.
//  Copyright (c) 2015年 astrotom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView : UIScrollView!
    
    var pHeight:CGFloat = 240.0
    var pWidth:CGFloat = 375.0
    
    let pNum:Int = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var i=0;i < pNum; i++ {
            var n:Int = i+1
            //UIImageのインスタンスを作成
            var image:UIImage! = UIImage(named:"\(n).png")
            //UIImageの初期化
            var imageView = UIImageView(image: image)
            var rect:CGRect = imageView.frame
            rect.size.height = pHeight
            rect.size.width = pWidth
            imageView.frame = rect
            imageView.tag = n
            //UIImagwViewをViewに追加
            self.scrollView.addSubview(imageView)
        }
        setupScrollImages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupScrollImages(){
        var imageDummy:UIImage! = UIImage(named: "1.png")
        var imgView = UIImageView(image: imageDummy)
        var subview:Array = scrollView.subviews
        
        var px:CGFloat = 0.0
        var py:CGFloat = 100.0
        
        for var i=0; i<subview.count; i++ {
            imgView = subview[i] as! UIImageView
            if (imgView.isKindOfClass(UIImageView) && imgView.tag > 0){
                var viewFrame:CGRect = imgView.frame
                viewFrame.origin = CGPointMake(px, py)
                imgView.frame = viewFrame
                px += (pWidth)
            }
        }
        var nWidth:CGFloat = pWidth*CGFloat(pNum)
        scrollView.contentSize = CGSizeMake(nWidth, pHeight)
    }

}


