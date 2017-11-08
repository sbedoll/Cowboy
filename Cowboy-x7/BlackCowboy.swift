//
//  Sheriff.swift
//  Cowboy-x7
//
//  Created by stuart bedoll on 5/1/17.
//  Copyright © 2017 Bad Basset. All rights reserved.
//
import SpriteKit
import Foundation
class FatCowboy: GameCharacter {
    var townCamera : SKCameraNode!
    var cowboy : SKSpriteNode!
    var cowboyWalkingFrames : [SKTexture]!
    var townPosition: CGPoint!
    var viewBounds: CGRect!
    var screen: UIScreen!
    var timer:Timer!
    var gtimer:GameTimer!
     override init(thescene:GameScene){
        super.init(thescene: thescene)
        let atlas = SKTextureAtlas(named:"newsherrif-v1")
        screen = UIScreen.main
        
        let numImages = atlas.textureNames.count
        print("fatcowboy class: numimages "+String(numImages))
        var cowboyWalkTextures = [SKTexture]()
        var cowboyTextureName = ""
        // for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages{
            if (i < 10){
                cowboyTextureName = "characterwalk_frame_0\(i)"
            }
            else{
                cowboyTextureName = "characterwalk_frame_\(i)"
            }
            print("fatcowboy class: image name "+cowboyTextureName)
            cowboyWalkTextures.append(atlas.textureNamed(cowboyTextureName))
        }
        cowboyWalkingFrames = cowboyWalkTextures
        let firstFrame = cowboyWalkingFrames[0]
        cowboy = SKSpriteNode(texture: firstFrame)
        cowboy.position = CGPoint(x:thescene.frame.midX+100, y:(thescene.frame.midY-230))
        thescene.addChild(cowboy)
        
    }
    func walkingCowBoy() {
        //This is our general runAction method to make our bear walk.
            cowboy.run(SKAction.repeatForever(
            SKAction.animate(with: cowboyWalkingFrames,
                             timePerFrame: 0.07,
                             resize: false,
                             restore: true)),
                   withKey:"walkingInPlaceFatCowBoy")
    }
    func moveTo(newLocation: CGPoint){
        
        cowboy.position = newLocation
        
    }
}
