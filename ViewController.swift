//
//  ViewController.swift
//  chooseSongsDem/Users/shienfang/Desktop/C/chooseSongsDemo/chooseSongsDemo/Assets.xcassetso
//
//  Created by 方仕賢 on 2022/1/18.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    //選擇歌曲類型相關元件
    @IBOutlet weak var songTypeView: UIView!
    @IBOutlet weak var engilshSongsButton: UIButton!
    @IBOutlet weak var chineseSongsButton: UIButton!
    
    //顯示音符徽章的相關元件
    @IBOutlet var goldenCollection: [UIImageView]!
    
    @IBOutlet var silverCollection: [UIImageView]!
    
    @IBOutlet weak var trophyView: UIView!
    
    @IBOutlet var copperCollection: [UIImageView]!
    
    @IBOutlet weak var backToTypeButton: UIButton!
    
    //選擇題遊戲相關元件
    
    @IBOutlet weak var gameView: UIView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var keepPlayingLabel: UILabel!
    
    @IBOutlet weak var checkResultButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var nextLabel: UILabel!
    
    @IBOutlet var optionButtons: [UIButton]!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var songImageView: UIImageView!
    
    //顯示結果的相關元件
    
    @IBOutlet weak var scoreView: UIView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var trophyImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
   
    let player = AVPlayer()
   
    var timer: Timer?
    
    var correctCount = 0
    var wrongCount = 0
    
    var index = 0
    
    var isChinese = false
    var isEnglish = false
    
    var numberFormatter = NumberFormatter()
    
    var copperImages = ["copperNote1", "copperNote2"]
    var goldenImages = ["goldenNote1", "goldenNote2", "goldenNote3", "goldenNote4"]
    var silverImages = ["silverNote1", "silverNote2", "silverNote3", "silverNote4"]
    
    
    var remainMinuteText = ""
    var remainSecondText = ""
    
    @IBOutlet weak var remainTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextButton.isHidden = true
        songImageView.isHidden = true
        checkResultButton.isHidden = true
        trophyView.isHidden = true
        keepPlayingLabel.isHidden = true
        nextLabel.isHidden = true
        
    }
    
    //增加對錯題數的方法
    func addCount(answerIndex: Int, songName: String, buttonIndex: Int, imageName: String) {
        
        
        if answerIndex == buttonIndex {
            
            resultLabel.text = "Congradulations! 你答對了！"
            
            correctCount += 1
            
        } else {
            
            resultLabel.text = "Oops! 這首歌是 \(songName)"
            
            wrongCount += 1
        }
        
        songImageView.image = UIImage(named: imageName )
        
    }
    
    //檢查答案對錯的方法
    @IBAction func checkAnswer(_ sender: UIButton) {
        
        songImageView.isHidden = false
        
        switch sender {
            
        case optionButtons[0]:
            
            if isChinese {
                
                addCount(answerIndex: chineseSongs[index].answerIndex, songName: chineseSongs[index].song, buttonIndex: 0, imageName: chineseSongs[index].image)
                
            } else if isEnglish {
                
                addCount(answerIndex: engilshSongs[index].answerIndex, songName: engilshSongs[index].song, buttonIndex: 0, imageName: engilshSongs[index].image)
                
            }
            
        case optionButtons[1]:
            if isChinese {
                
                addCount(answerIndex: chineseSongs[index].answerIndex, songName: chineseSongs[index].song, buttonIndex: 1, imageName: chineseSongs[index].image)
                
                
            } else if isEnglish {
                
                addCount(answerIndex: engilshSongs[index].answerIndex, songName: engilshSongs[index].song, buttonIndex: 1, imageName: engilshSongs[index].image)
               
            }
            
            
        default:
            
            if isChinese {
                
                addCount(answerIndex: chineseSongs[index].answerIndex, songName: chineseSongs[index].song, buttonIndex: 2, imageName: chineseSongs[index].image)
                
            } else if isEnglish {
                
                addCount(answerIndex: engilshSongs[index].answerIndex, songName: engilshSongs[index].song, buttonIndex: 2, imageName: engilshSongs[index].image)
                
            }
        }
        
        //檢視是否為最後一題
        if index == 9 {
            
            nextButton.isHidden = true
            checkResultButton.isHidden = false
            
        } else {
            
            nextButton.isHidden = false
            playButton.isHidden = false
            pauseButton.isHidden = true
            
            nextLabel.isHidden = false
        
        }
        
        keepPlayingLabel.isHidden = false
        player.pause()
        
    }
    
    //設定到數計時的方法
    func setTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayTime) , userInfo: nil, repeats: true)
        
    }
    
    //顯示歌曲時間的方法
    @objc func displayTime() {
        
       
        let remainTime = String(format: "%.0f", (Double(180)-player.currentTime().seconds))
        
        remainMinuteText = String(Int(remainTime)!/60)
        
        
        remainSecondText = String( Int(remainTime)! % 60)
        
            
        
        
        if Int(remainSecondText)! < 10 {
            remainTimeLabel.text = "0\(remainMinuteText):0\(remainSecondText)"
            
        } else {
            remainTimeLabel.text = "0\(remainMinuteText):\(remainSecondText)"
            
        }
     
    }

    //加入即將播放歌曲的方法
    func music(type: [Question], index: Int) {
        
        let fileURL = Bundle.main.url(forResource: type[index].song, withExtension: "mp3")
        
        let playerItem = AVPlayerItem(url: fileURL!)
            player.replaceCurrentItem(with: playerItem)
            
    }
    
   
    //選擇題目的按鈕
    @IBAction func shuffleSongs(_ sender: UIButton) {
        
        playButton.isHidden = false
        
        switch sender {
            
        case chineseSongsButton:
            
            chineseSongs.shuffle()
            isChinese = true
            
            setTheGame(songType: chineseSongs, totalSongs: chineseSongs.count, options: chineseSongs[index].options, image: chineseSongs[index].image)
            
        case engilshSongsButton:
            engilshSongs.shuffle()
            
            isEnglish = true
            
            setTheGame(songType: engilshSongs, totalSongs: engilshSongs.count, options: engilshSongs[index].options, image: engilshSongs[index].image)
            
        default:
            index += 0
        }
        
        player.play()
        displayTime()
        
        gameView.isHidden = false
        songTypeView.isHidden = true
        pauseButton.isHidden = false
        
    }
    
    
    //播放歌的按紐
    @IBAction func play(_ sender: UIButton) {
        
        switch sender {
            
        case pauseButton:
            player.pause()
            pauseButton.isHidden = true
            playButton.isHidden = false
            
        default:
            player.play()
            playButton.isHidden = true
            pauseButton.isHidden = false
        }
        
       setTimer()
       displayTime()
        
    }
    
    //重置每一題的方法
    func setTheGame(songType: [Question], totalSongs: Int, options: [String], image: String){
        
            
            music(type: songType, index: index)
            
            for i in 0...2 {
                
                optionButtons[i].setTitle(options[i], for: .normal)
                
            }
            
        setTimer()
        displayTime()
        
    }
    
    //顯示下一題的按鈕
    @IBAction func next(_ sender: UIButton) {
        
        nextButton.isHidden = true
        nextLabel.isHidden = true
        keepPlayingLabel.isHidden = true
        
        index += 1
        
        if isChinese {
            
            setTheGame(songType: chineseSongs, totalSongs: chineseSongs.count, options: chineseSongs[index].options, image: chineseSongs[index].image)
            
        } else if isEnglish {
            
            setTheGame(songType: engilshSongs, totalSongs: engilshSongs.count, options: engilshSongs[index].options, image: engilshSongs[index].image)
            
        }
        
        pauseButton.isHidden = false
        playButton.isHidden = true
        songImageView.isHidden = true
        resultLabel.text = ""
        player.play()
    }
    
    //控制音量的滑桿
    @IBAction func controlVolume(_ sender: UISlider) {
        
        player.volume = sender.value
        
    }
    
    //確認結果的按鈕
    @IBAction func checkResult(_ sender: Any) {
        
        scoreView.isHidden = false
        gameView.isHidden = true
        
        scoreLabel.text = "答對 \(correctCount) 題， 答錯 \(wrongCount) 題"
        
        if correctCount < 3 {
            
            descriptionLabel.text = "你需要多聽歌!!"
            
            
        } else if correctCount < 6 {
            
            descriptionLabel.text = "還可以 有在聽歌\n 獲得銅色音符"
            trophyImageView.image = UIImage(named: copperImages.randomElement()!)
            addImage(image: copperImages, collection: copperCollection)
            
        } else if correctCount < 9 {
            
            descriptionLabel.text = "不錯嘛 很常聽歌\n 獲得銀色音符"
            trophyImageView.image = UIImage(named: silverImages.randomElement()!)
            addImage(image: silverImages, collection: silverCollection)
            
        } else {
            
            descriptionLabel.text = "猜歌大神\n 獲得金色音符"
            trophyImageView.image = UIImage(named: goldenImages.randomElement()!)
            
            addImage(image: goldenImages, collection: goldenCollection)
        }
    }
    
    //將徽章加進收藏的方法
    func addImage(image: [String], collection: [UIImageView]){
        
        var num = 3
        
        if collection == copperCollection {
            num = 1
            
        }
        
        for index in 0...num {
            
            if trophyImageView.image == UIImage(named: image[index]) {
                
                collection[index].image = UIImage(named: image[index])
            }
            
        }
        
        
    }
    
    //再玩一次的按鈕
    @IBAction func playAgain(_ sender: Any) {
        
        correctCount = 0
        wrongCount = 0
        index = 0
        
        songTypeView.isHidden = false
        resultLabel.text = ""
        
        
        songImageView.image = nil
        checkResultButton.isHidden = true
        
        isChinese = false
        isEnglish = false
        
    }
    
    //顯示音符徽章的按鈕
    @IBAction func showNotesCollection(_ sender: UIButton) {
        
        if sender == backToTypeButton {
            
            trophyView.isHidden = true
            
        } else {
            
            trophyView.isHidden = false
        }
    }
    
    
    
}

