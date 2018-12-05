//
//  CameraPhotoLibraryPermissionsValidator.swift
//  TheWing
//
//  Created by Luna An on 4/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit
import Photos

/// The Camera & Photo Library Permissions Validator.
open class CameraPhotoLibraryPermissionsValidator {
    
    // MARK: - Private Properties
    
    private var viewController: UIViewController
    
    // MARK: - Initialization
    
    /// Default initializer of the class.
    ///
    /// - Parameter viewController: Current top view controller used to display alerts if needed.
    public init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Public Functions
    
    /// Checks the camera's permissions status.
    public func checkCameraPermissions() {
        let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch cameraStatus {
        case .notDetermined:
            requestCameraPemissions()
        case .authorized:
            presentImagePicker(.camera)
        case .denied:
            presentPermissionsAlert(.camera)
        default:
            return
        }
    }
    
    /// Checks the photo library's permissions status.
    public func checkPhotoLibraryPermissions() {
        let photoLibraryPermissionStatus = PHPhotoLibrary.authorizationStatus()
        switch photoLibraryPermissionStatus {
        case .notDetermined:
            requestPhotoPemissions()
        case .authorized:
            presentImagePicker(.photoLibrary)
        case .denied:
            presentPermissionsAlert(.photoLibrary)
        default:
            return
        }
    }
    
}

// MARK: - Private Functions
private extension CameraPhotoLibraryPermissionsValidator {
    
    func requestPhotoPemissions() {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                self.presentImagePicker(.photoLibrary)
            case .denied:
                self.presentPermissionsAlert(.photoLibrary)
            default:
                return
            }
        }
    }
    
    func presentImagePicker(_ sourceType: UIImagePickerControllerSourceType) {
        guard let viewController = viewController as?
                UIViewController &
                UIImagePickerControllerDelegate &
                UINavigationControllerDelegate else {
                return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = viewController
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    func presentPermissionsAlert(_ sourceType: UIImagePickerControllerSourceType) {
        let title: String
        let message: String
        
        switch sourceType {
        case .camera:
            title = "CAMERA_ACCESS_DENIED".localized(comment: "Camera access denied")
            message = "GRANT_PERMISSION_IN_SETTINGS".localized(comment: "Grant permission in Settings")
        case .photoLibrary:
            title = "PHOTO_ACCESS_DENIED".localized(comment: "Photo access denied")
            message = "GRANT_PERMISSION_IN_SETTINGS".localized(comment: "Grant permission in Settings")
        default:
            return
        }
        
        let firstActionTitle = "CANCEL_TITLE".localized(comment: "Cancel")
        let secondActionTitle = "SETTINGS".localized(comment: "Settings")
        let alert = UIAlertController.doubleActionAlertController(title: title,
                                                                  message: message,
                                                                  actionOneTitle: firstActionTitle,
                                                                  actionTwoTitle: secondActionTitle,
                                                                  actionTwo: { UIApplication.shared.openSettings() })
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func requestCameraPemissions() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                self.presentImagePicker(.camera)
            } else {
                self.presentPermissionsAlert(.camera)
            }
        }
    }
    
}

