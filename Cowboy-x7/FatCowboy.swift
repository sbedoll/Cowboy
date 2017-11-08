//
//  Sheriff.swift
//  Cowboy-x7
//
//  Created by stuart bedoll on 5/1/17.
//  Copyright © 2017 Bad Basset. All rights reserved.
//
import SpriteKit
import Foundation
class Sheriff {
    var townCamera : SKCameraNode!
    var cowboy : SKSpriteNode!
    var cowboyWalkingFrames : [SKTexture]!
    var townPosition: CGPoint!
    var viewBounds: CGRect!
    var timer:Timer!
    var gtimer:GameTimer!
     init(thescene:GameScene){
        //super.init(thescene: thescene)
        let atlas = SKTextureAtlas(named:"CowboyImages")
        let numImages = atlas.textureNames.count
        var cowboyWalkTextures = [SKTexture]()
        var cowboyTextureName = ""
        // for var i=1; i<=numImages; i += 1 {
        for i in 1...numImages{
            if (i < 10){
                cowboyTextureName = "cowboygame1000\(i)"
            }else{
                cowboyTextureName = "cowboygame100\(i)"
            }
            cowboyWalkTextures.append(atlas.textureNamed(cowboyTextureName))
        }
        cowboyWalkingFrames = cowboyWalkTextures
        let firstFrame = cowboyWalkingFrames[0]
        cowboy = SKSpriteNode(texture: firstFrame)
        cowboy.position = CGPoint(x:thescene.frame.midX, y:(thescene.frame.midY-230))
        thescene.addChild(cowboy)
        
    }
    func walkingCowBoy() {
        //This is our general runAction method to make our bear walk.
            cowboy.run(SKAction.repeatForever(
            SKAction.animate(with: cowboyWalkingFrames,
                             timePerFrame: 0.07,
                             resize: false,
                             restore: true)),
                   withKey:"walkingInPlaceCowBoy")
    }
}
