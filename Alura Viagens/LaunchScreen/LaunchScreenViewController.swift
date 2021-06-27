//
//  LaunchScreenViewController.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 27/06/21.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var constraintTituloTop: NSLayoutConstraint!
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        iniciaAnimacao()
    }
    
    // MARK: - Metodos
    func iniciaAnimacao() {
        UIView.animate(withDuration: 1.0) {
            self.constraintTituloTop.constant -= 125
            self.view.layoutIfNeeded()
        } completion: { (_) in
            self.irParaHome()
        }
    }
    
    func irParaHome() {
        let tabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tab-bar")
        tabBar.modalPresentationStyle = .fullScreen
        let navigation = UINavigationController(rootViewController: tabBar)
        navigation.modalPresentationStyle = .fullScreen
        navigation.setNavigationBarHidden(true, animated: false)
        present(navigation, animated: true)
    }
    
}
