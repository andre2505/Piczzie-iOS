//
//  CameraViewController.swift
//  piczzie
//
//  Created by Thomas on 14/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import UIKit
import SwiftUI
import Photos
import YPImagePicker

struct CameraIntegratedViewController : UIViewControllerRepresentable{
    
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: CameraIntegratedViewController
        
        init(_ parent: CameraIntegratedViewController) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<CameraIntegratedViewController>) ->  YPImagePicker {
        
        
        var config = YPImagePickerConfiguration()
        
        config.onlySquareImagesFromCamera = true
        config.usesFrontCamera = false
        config.showsPhotoFilters = false
        
        config.wordings.cameraTitle = ""
        
        config.startOnScreen = YPPickerScreen.photo
        config.hidesBottomBar = true
        config.hidesStatusBar = true
        
        config.isScrollToChangeModesEnabled = false
        config.screens = [.photo]
        
        config.colors.coverSelectorBorderColor = .red
        config.albumName = "Piczzie"
        
        let picker = YPImagePicker(configuration: config)
        
        picker.navigationBar.isHidden = true
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            if let photo = items.singlePhoto {
                print("take")
            }
            self.presentationMode.wrappedValue.dismiss()
        }
       
        picker.delegate = context.coordinator
        
        return picker
    }
    
    public func updateUIViewController(_ uiViewController:  YPImagePicker, context: UIViewControllerRepresentableContext<CameraIntegratedViewController>) {
    }
}
