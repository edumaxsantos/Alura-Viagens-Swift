//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 23/06/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    var pacoteComprado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pacote = pacoteComprado {
            print(pacote)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
