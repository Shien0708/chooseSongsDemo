//
//  gameMode.swift
//  chooseSongsDemo
//
//  Created by 方仕賢 on 2022/1/18.
//

import Foundation
import UIKit

struct Question {
    
    var song: String
    
    var answerIndex: Int
    
    var options: [String]
    
    var image: String
    
    
}

var chineseSongs = [
    Question(song: "Without You", answerIndex: 2, options: ["Runaway", "Why You Gonna Lie", "Without You"], image: "withoutYou"),
    Question(song: "帥到分手", answerIndex: 1, options: ["需要你的美","帥到分手","你是我的菜"], image: "帥到分手"),
    Question(song: "刻在我心底的名字", answerIndex: 0, options: ["刻在我心底的名字", "魚仔", "早安！ 晨之美"], image: "刻在我心底的名字"),
    Question(song: "想見你想見你想見你", answerIndex: 2, options: ["東區東區", "最好的結局", "想見你想見你想見你"], image: "想見你"),
    Question(song: "地球上最浪漫的一首歌", answerIndex: 0, options: ["地球上最浪漫的一首歌", "不屑", "愛的進行曲"], image: "地球上最浪漫的一首歌"),
    Question(song: "還是會", answerIndex: 1, options: ["有人在等我", "還是會", "心醉心碎"], image: "還是會"),
    Question(song: "怎麼了", answerIndex: 1, options: ["Room for You", "怎麼了", "終於了解自由"], image: "怎麼了"),
    Question(song: "路過人間", answerIndex: 2, options: ["微加幸福", "指望", "路過人間"], image: "路過人間"),
    Question(song: "光之海", answerIndex: 0, options: ["光之海", "有一種悲傷", "幸福了 然後呢"], image: "光之海"),
    Question(song: "Easy Come Easy Go", answerIndex: 1, options: ["紅色高跟鞋", "Easy Come Easy Go", "達爾文"], image: "easyComeEasyGo")
]

var engilshSongs = [
    Question(song: "Peaches", answerIndex: 0, options: ["Peaches", "I'm the One", "Let me love You"], image: "peaches"),
    Question(song: "Happier Than Ever", answerIndex: 1, options: ["Lost Cost", "Happier Than Ever", "Your Power"], image: "happierThanEver"),
    Question(song: "Save Your Tears", answerIndex: 2, options: ["Starboy", "Positions", "Save Your Tears"], image: "saveYourTears"),
    Question(song: "Fingers Crossed", answerIndex: 0, options: ["Fingers Crossed", "Unplugged", "Always Remember Us This Way"], image: "fingersCrossed"),
    Question(song: "Infinity", answerIndex: 1, options: ["Tied Down", "Infinity", "Stone On You"], image: "infinity"),
    Question(song: "Brave", answerIndex: 2, options: ["Everything I didn't Say", "Let's Go Home Together", "Brave"], image: "brave"),
    Question(song: "Dont Wake Me Up", answerIndex: 0, options: ["Don't Wake Me Up", "Mama", "What I Like About You"], image: "dontWakeMeUp"),
    Question(song: "Oh My God", answerIndex: 1, options: ["Easy On Me", "Oh My God", "Hold On"], image: "ohMyGod"),
    Question(song: "Leave The Door Open", answerIndex: 2, options: ["24K Magic", "UpDown Funk", "Leave The Door Open"], image: "leaveTheDoorOpen"),
    Question(song: "Beautiful Mistakes", answerIndex: 0, options: ["Beautiful Mistakes", "Girls Like You", "Sugar"], image: "beautifulMistakes"),
    Question(song: "Bad Habits", answerIndex: 1, options: ["Shape Of You", "Bad Habits", "Photograph"], image: "badHabits"),
    Question(song: "Levitating", answerIndex: 2, options: ["Physical", "Break My Heart", "Levitating"], image: "levitating")]
