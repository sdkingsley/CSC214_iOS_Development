//
//  Makeup.swift
//  Assignment7
//
//  Created by Sarah Kingsley on 10/31/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class Makeup: NSObject{
    var faces: [Face] = []
    var listlips: [Lips] = []
    var listeyes: [Eyes] = []
    
    func addFace(_ face:Face) -> Int {
        faces.append(face)
        return faces.index(of:face)!
    }
    
    func removeFace(_ face:Face){
        if let index = faces.index(of: face){
            faces.remove(at: index)
        }
    }
    
    func moveFace(_ fromIndex:Int, _ toIndex:Int){
        if fromIndex != toIndex{
            let face = faces[fromIndex]
            faces.remove(at: fromIndex)
            faces.insert(face, at: toIndex)
        }
    }
    
    func addLips(_ lips:Lips) -> Int {
        listlips.append(lips)
        return listlips.index(of:lips)!
    }
    
    func removeLips(_ lips:Lips){
        if let index = listlips.index(of: lips){
            listlips.remove(at: index)
        }
    }
    
    func moveLips(_ fromIndex:Int, _ toIndex:Int){
        if fromIndex != toIndex{
            let lips = listlips[fromIndex]
            listlips.remove(at: fromIndex)
            listlips.insert(lips, at: toIndex)
        }
    }
    
    func addEyes(_ eyes:Eyes) -> Int {
        listeyes.append(eyes)
        return listeyes.index(of:eyes)!
    }
    
    func removeEyes(_ eyes:Eyes){
        if let index = listeyes.index(of: eyes){
            listeyes.remove(at: index)
        }
    }
    
    func moveEyes(_ fromIndex:Int, _ toIndex:Int){
        if fromIndex != toIndex{
            let eyes = listeyes[fromIndex]
            listeyes.remove(at: fromIndex)
            listeyes.insert(eyes, at: toIndex)
        }
    }
    
    //
    // helper functions for making random stuff
    //
    
    func addRandomFace() -> Int? {
        let kinds = ["Tinted Moisturizer", "Light Coverage Foundation", "Medium/Heavy Coverage Foundation", "Dewey Finish", "Matte Finish", "Natrual Finish"]
        let brands = ["Nars", "Maybelline", "Dior", "Hourglass", "Bare Minerals", "L'Oreal", "Estee Lauder"]
        
        let rKindIndex = arc4random_uniform(UInt32(kinds.count))
        let rKind = kinds[Int(rKindIndex)]
        
        let rBrandsIndex = arc4random_uniform(UInt32(brands.count))
        let rBrand = brands[Int(rBrandsIndex)]
        
        return addFace(Face(rKind, rBrand))
    }
    
    func addRandomLips() -> Int? {
        let kinds = ["Moisturing Lip Tint", "Lip Stain", "Creamy Lipstick", "Matte Lipstick", "Liquid Lipstick", "Lip Liner"]
        let brands = ["Nars", "Maybelline", "Dior", "Hourglass", "Bare Minerals", "L'Oreal", "Estee Lauder"]
        let colors = ["Pink", "Orange", "Nude", "90s Brown", "Orangy/Red", "Red", "Your Lips but Better"]
        
        let rKindIndex = arc4random_uniform(UInt32(kinds.count))
        let rKind = kinds[Int(rKindIndex)]
        
        let rBrandsIndex = arc4random_uniform(UInt32(brands.count))
        let rBrand = brands[Int(rBrandsIndex)]
        
        let rColorsIndex = arc4random_uniform(UInt32(colors.count))
        let rColor = colors[Int(rColorsIndex)]
        
        return addLips(Lips(rKind, rBrand,rColor))
    }
    
    func addRandomEyes() -> Int? {
        let kinds = ["Single Eye Shadow", "Liquid Eyeshadow", "Cream Eye Shadow", "Quaterlet", "Palette", "Eye Liner"]
        let brands = ["Nars", "Maybelline", "Dior", "Hourglass", "Bare Minerals", "L'Oreal", "Estee Lauder"]
        let tones = ["Pinky", "Warm", "Cool", "Smokey", "Sparkley", "Matte", "Natural"]
        
        let rKindIndex = arc4random_uniform(UInt32(kinds.count))
        let rKind = kinds[Int(rKindIndex)]
        
        let rBrandsIndex = arc4random_uniform(UInt32(brands.count))
        let rBrand = brands[Int(rBrandsIndex)]
        
        let rTonesIndex = arc4random_uniform(UInt32(tones.count))
        let rTone = tones[Int(rTonesIndex)]
        
        return addEyes(Eyes(rKind, rBrand, rTone))
    }

}
