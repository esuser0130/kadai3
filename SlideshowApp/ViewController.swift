//
//  ViewController.swift
//  SlideshowApp
//
//  Created by EsAdmin on 2020/02/29.
//  Copyright © 2020 seiya.yokoyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var image1 = UIImage(named:"drop-of-water-2256201_640")!
    var image2 = UIImage(named:"galaxy-4828098_640")!
    var image3 = UIImage(named:"grundarfjorur-3516525_640")!
    var ary:Array<UIImage> = []
    var idx:Int = 0
    var timer: Timer!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    var flg = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ary.append(image1)
        ary.append(image2)
        ary.append(image3)
        imgView.image = ary[0]
    }

    @IBAction func btnStart(_ sender: UIButton) {
        if (!flg){
            flg = true
            btnBack.isEnabled = false
            btnNext.isEnabled = false
            sender.setTitle("停止", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nextImg(_ :)), userInfo: nil, repeats:true)
        } else{
            stopTimer()
        }
    }
    @IBAction func btnNext(_ sender: UIButton) {
        if(idx == ary.count - 1){
            idx = 0
        } else{
            idx += 1
        }
        imgView.image = ary[idx]
    }
    @IBAction func btnBack(_ sender: UIButton) {
        if(idx == 0){
            idx = ary.count - 1
        } else{
            idx -= 1
        }
        imgView.image = ary[idx]
    }
    @objc func nextImg(_ timer: Timer) {
        if(idx == ary.count - 1){
            idx = 0
        } else{
            idx += 1
        }
        imgView.image = ary[idx]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(timer != nil){
            stopTimer()
        }
        
        // segueから遷移先のResultViewControllerを取得する
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        secondViewController.img = ary[idx]
    }
    
    func stopTimer(){
        flg = false
        btnBack.isEnabled = true
        btnNext.isEnabled = true
        timer.invalidate()
        timer = nil
        startBtn.setTitle("再生", for: .normal)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {

    }
}

