//
//  ViewControllerB.swift
//  AdaptiveLayout_Programmatically
//
//  Created by Cyrus on 26/6/2022.
//

import UIKit

class ViewControllerB: UIViewController {

    private let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let scrollStackViewContainer: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.spacing = 20 // Spacing between scrollStackViewContainers
        v.distribution = .fillEqually
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isLayoutMarginsRelativeArrangement = true
        v.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30) // Set margins to scrollStackViewContainer
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed

        // add the scroll view to self.view
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        ViewControllerViewB()
    }
    
    // MARK: - Method
    
    @objc func show_NonIBAction_ViewB() {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction private func show_IBAction_ViewB(_ sender: UIButton) {}
}

// MARK: - UI Layout

extension ViewControllerB {
    private func ViewControllerViewB(){
        let parentView = self.view!
        
        // Button
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "lego"), for: .normal)
        btn.addTarget(self, action: #selector(show_NonIBAction_ViewB), for: .touchUpInside) // @objc func
//        smartPhoneIcon.addTarget(self, action: #selector(show_IBAction_ViewB(_:)), for: .touchUpInside) // IBAction func
        parentView.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        let btn_xConstraint = btn.centerXAnchor.constraint(equalTo: parentView.centerXAnchor)
        let btn_yConstraint = btn.centerYAnchor.constraint(equalTo: parentView.bottomAnchor, constant: parentView.frame.size.height * -0.2)
        let btn_wConstraint = btn.widthAnchor.constraint(equalToConstant: 50)
        let btn_hConstraint = btn.heightAnchor.constraint(equalToConstant: 50)
        parentView.addConstraints([btn_xConstraint, btn_yConstraint, btn_wConstraint, btn_hConstraint])
        
        for _ in 1...2 {
            // View
            let view = UIView()
            view.backgroundColor = UIColor.white
            view.layer.cornerRadius = 16
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            scrollStackViewContainer.addArrangedSubview(view)
        }
    }
}
