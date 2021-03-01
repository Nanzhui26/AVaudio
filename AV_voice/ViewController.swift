//
//  ViewController.swift
//  AV_voice
//
//  Created by Azure on 2021/2/28.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let record_mangeage = Recorder()//初始化
    
    @IBAction func recor(_ sender: UIButton) {
        record_mangeage.begainRecord()//开始录音
    }
    @IBAction func sto(_ sender: UIButton) {
        record_mangeage.stopRecord()//停止录音
    }
    @IBAction func pal(_ sender: UIButton) {
        record_mangeage.paly()//播放录音
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

