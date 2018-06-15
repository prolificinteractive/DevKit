//
//  ImagePickerValidator.swift
//  TheWing
//
//  Created by Luna An on 4/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// The image picker validator.
public class ImagePickerValidator {
    
    // MARK: - Private Properties
    
    private var viewController: UIViewController
    
    private lazy var cameraPhotoLibraryPermissionsValidator: CameraPhotoLibraryPermissionsValidator = {
        return CameraPhotoLibraryPermissionsValidator(viewController: viewController)
    }()
    
    // MARK: - Initialization
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Public Functions
    
    /// Checks the image picker's permissions status.
    ///
    /// - Parameter sourceType: The image picker controller soure type. (e.g. camera)
    func checkImagePickerPermissions(_ sourceType: UIImagePickerControllerSourceType) {
        switch sourceType {
        case .camera:
            cameraPhotoLibraryPermissionsValidator.checkCameraPermissions()
        case .photoLibrary:
            cameraPhotoLibraryPermissionsValidator.checkPhotoLibraryPermissions()
        default:
            return
        }
    }
    
}

extension UIViewController {

    @objc func presentPhotoLibraryPermissionsAlert() {
        let imagePickerValidator = ImagePickerValidator(viewController: self)

        let openCamera: () -> Void = {
            imagePickerValidator.checkImagePickerPermissions(.camera)
        }

        let openLibrary: () -> Void = {
            imagePickerValidator.checkImagePickerPermissions(.photoLibrary)
        }

        let firstOptionTitle = "TAKE_PHOTO".localized(comment: "Take Photo")
        let secondOptionTitle = "CHOOSE_FROM_LIBRARY".localized(comment: "Choose from Library")
        let alert = UIAlertController.doubleButtonActionSheet(buttonOneTitle: firstOptionTitle,
                                                              buttonTwoTitle: secondOptionTitle,
                                                              actionOne: openCamera,
                                                              actionTwo: openLibrary,
                                                              cancelButtonTitle: "Cancel")
        present(alert, animated: true, completion: nil)
    }
    
}
