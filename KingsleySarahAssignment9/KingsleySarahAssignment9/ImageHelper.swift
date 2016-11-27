//
//  ImageHelper.swift
//  KingsleySarahAssignment9
//
//  Created by Sarah Kingsley on 11/16/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

//adapted for use in this app from Professors code

import UIKit

class ImageHelper: NSObject {
    class func saveImage(_ image: UIImage, forUID uid: String) {
        let imageURL = ImageHelper.imageURLForUID(uid)
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            do {
                try data.write(to: imageURL, options: .atomic)
            }
            catch {
                print("could not save \(uid)")
            }
        }
    }
    
    class func getImage(forUID uid: String) -> UIImage? {
        let imageURL = ImageHelper.imageURLForUID(uid)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path) else {
            return nil
        }
        
        return imageFromDisk
    }
    
    class func imageURLForUID(_ key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent(key)
    }
}

