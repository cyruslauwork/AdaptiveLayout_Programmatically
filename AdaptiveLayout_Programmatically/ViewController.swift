//
//  ViewController.swift
//  AdaptiveLayout_Programmatically
//
//  Created by Cyrus on 24/6/2022.
//

import UIKit

enum UIUserInterfaceIdiom : Int {
    case unspecified
    
    case phone // iPhone and iPod touch style UI
    case pad   // iPad style UI (also includes macOS Catalyst)
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            // It's an iPhone
            viewController()
        case .pad:
            // It's an iPad (or macOS Catalyst)
            viewController()
        case .unspecified:
            return
        case .tv:
            return
        case .carPlay:
            return
        case .mac:
            return
        @unknown default:
            return
        }
    }
    
    // MARK: - Method
    
    @objc func show_NonIBAction_View() {
        // *If not having Storyboard ID
        let vc = ViewControllerB()
        // Present Setting
        //        vc.isModalInPresentation = true
        //        vc.modalPresentationStyle = .fullScreen
        // Present destination view controller
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction private func show_IBAction_View(_ sender: UIButton) {}
}

// MARK: - UI Layout

extension ViewController {
    private func viewController() {
        let parentView = self.view!
        
        // For CGSize Constants on Percentage
        // Style 1: By View Size
//        let sth_hConstraint = view.heightAnchor.constraint(equalToConstant: parentView.frame.size.height * 0.5)
        // Style 2: By Device Screen Size
//        let sth_wConstraint = view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width * 0.5)
        
        // View
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        view.layer.cornerRadius = 64
        parentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let view_xConstraint = view.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let view_yConstraint = view.centerYAnchor.constraint(equalTo: parentView.bottomAnchor, constant: parentView.frame.size.height * -0.15)
        let view_wConstraint = view.widthAnchor.constraint(equalToConstant: parentView.frame.size.width)
        let view_hConstraint = view.heightAnchor.constraint(equalToConstant: parentView.frame.size.height * 0.5)
        parentView.addConstraints([view_xConstraint, view_yConstraint, view_wConstraint, view_hConstraint])
        
        // Image
        let imgSrc:UIImage = UIImage(named: "lego")!
        let img = UIImageView(image: imgSrc)
        img.contentMode = .center
        img.contentMode = .scaleAspectFit
        parentView.addSubview(img)
        img.translatesAutoresizingMaskIntoConstraints = false
        let img_xConstraint = img.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let img_yConstraint = img.centerYAnchor.constraint(equalTo: parentView.topAnchor, constant: parentView.frame.size.height * 0.2)
        let img_wConstraint = img.widthAnchor.constraint(equalToConstant: parentView.frame.size.width * 0.75)
        let img_hConstraint = img.heightAnchor.constraint(equalToConstant: parentView.frame.size.height * 0.15)
        parentView.addConstraints([img_xConstraint, img_yConstraint, img_wConstraint, img_hConstraint])
        
        // Repeat Upside Down Image
        let imgSrc2:UIImage = UIImage(cgImage: imgSrc.cgImage!, scale: imgSrc.scale, orientation: .down)
        let img2 = UIImageView(image: imgSrc2)
        img2.contentMode = .center
        img2.contentMode = .scaleAspectFit
        parentView.addSubview(img2)
        img2.translatesAutoresizingMaskIntoConstraints = false
        let img2_xConstraint = img2.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let img2_yConstraint = img2.centerYAnchor.constraint(equalTo: parentView.topAnchor, constant: parentView.frame.size.height * 0.4)
        let img2_wConstraint = img2.widthAnchor.constraint(equalToConstant: parentView.frame.size.width * 0.75)
        let img2_hConstraint = img2.heightAnchor.constraint(equalToConstant: parentView.frame.size.height * 0.15)
        parentView.addConstraints([img2_xConstraint, img2_yConstraint, img2_wConstraint, img2_hConstraint])
        
        // Label
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14) // For Fixed Font Size
        guard let customFont = UIFont(name: "HelveticaNeue-Bold", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the custom font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "Label"
        parentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let label_xConstraint = label.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let label_yConstraint = label.centerYAnchor.constraint(equalTo: parentView.bottomAnchor, constant: parentView.frame.size.height * -0.1)
        let label_wConstraint = label.widthAnchor.constraint(equalToConstant: parentView.frame.size.width * 0.75)
        let label_hConstraint = label.heightAnchor.constraint(equalToConstant: parentView.frame.size.height * 0.15)
        parentView.addConstraints([label_xConstraint, label_yConstraint, label_wConstraint, label_hConstraint])
        
        // Button
        let btn = UIButton()
        btn.setImage(UIImage(named: "lego"), for: .normal)
        btn.addTarget(self, action: #selector(show_NonIBAction_View), for: .touchUpInside) // @objc func
        //        smartPhoneIcon.addTarget(self, action: #selector(show_IBAction_View(_:)), for: .touchUpInside) // IBAction func
        btn.imageView?.contentMode = .center
        btn.imageView?.contentMode = .scaleAspectFit
        parentView.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        let btn_xConstraint = btn.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let btn_yConstraint = btn.centerYAnchor.constraint(equalTo: parentView.bottomAnchor, constant: parentView.frame.size.height * -0.2)
        let btn_wConstraint = btn.widthAnchor.constraint(equalToConstant: parentView.frame.size.width * 0.15)
        let btn_hConstraint = btn.heightAnchor.constraint(equalToConstant: parentView.frame.size.width * 0.15)
        parentView.addConstraints([btn_xConstraint, btn_yConstraint, btn_wConstraint, btn_hConstraint])
    }
}
