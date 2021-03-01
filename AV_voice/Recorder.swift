//
//  Recorder.swift
//  AV_voice
//
//  Created by Azure on 2021/2/28.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation
import AVFoundation

class Recorder{
    var recorder : AVAudioRecorder?
    var palyer : AVAudioPlayer?
    //文件路径？
    let file_path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first?.appending("/record.wav")
    
    //开始录音函数
    func begainRecord(){
        let session = AVAudioSession.sharedInstance()
        //设置session类型
        do{
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        }catch  let err{
            print("设置类型失败:\(err.localizedDescription)")
        }
        //设置session动作
        do{
            try session.setActive(true)
        }catch let err{
            print("设置动作失败:\(err.localizedDescription)")
        }
        //录音，设置成NSNumber
        let recordSetting:[String:Any]=[AVSampleRateKey:NSNumber(value:16000),//采样率
            AVFormatIDKey:NSNumber(value:kAudioFormatLinearPCM),//音频格式
            AVLinearPCMBitDepthKey:NSNumber(value:16),//采样位数
            AVNumberOfChannelsKey:NSNumber(value:1),//通道数
            AVEncoderAudioQualityForVBRKey:NSNumber(value:AVAudioQuality.min.rawValue)//质量
        ];
        //开始录音
        do{
            let url = URL(fileURLWithPath: file_path!)
            recorder = try AVAudioRecorder(url: url, settings: recordSetting)
            recorder!.prepareToRecord()
            recorder!.record()
            print("开始录音")
        }catch let err{
            print("录音失败:\(err.localizedDescription)")
        }
    }
    //结束录音函数
    func stopRecord(){
        if let recorder = self.recorder {
            if recorder.isRecording {
                print("正在录音，马上结束！录音保存到了:\(file_path!)")
            }else{
                print("设备并不在录音！")
            }
            recorder.stop()
            self.recorder = nil
        }else{
            print("未初始化！")
        }
    }
    //播放录音
    func paly(){
        do{
            palyer = try AVAudioPlayer(contentsOf : URL(fileURLWithPath: file_path!))
            print("录音长度：\(palyer!.duration)")
            palyer?.play()
        }catch let err {
            print("播放失败:\(err.localizedDescription)")
        }
    }
}
