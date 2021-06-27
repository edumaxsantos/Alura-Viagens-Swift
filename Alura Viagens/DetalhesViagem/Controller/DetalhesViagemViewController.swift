//
//  DetalhesViagemViewController.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 12/06/21.
//

import UIKit

class DetalhesViagemViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!
    
    @IBOutlet weak var textFieldNumeroCartao: UITextField!
    @IBOutlet weak var textFieldNomeCartao: UITextField!
    @IBOutlet weak var textFieldSenhaCartao: UITextField!
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }

        // Do any additional setup after loading the view.
    }
    
    func pulsar(_ button: UIButton) {
        let pulsar = CASpringAnimation(keyPath: "transform.scale")
        pulsar.duration = 0.5
        pulsar.autoreverses = true
        pulsar.repeatCount = 1
        pulsar.fromValue = 0.95
        pulsar.toValue = 1.0
        
        pulsar.initialVelocity = 0.5
        pulsar.damping = 1.0
        
        button.layer.add(pulsar, forKey: nil)
        
    }
    
    // MARK: - IBActions
    
    @IBAction func voltar(_ sender: UIButton) {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        
        let textFields = [textFieldNumeroCartao, textFieldNomeCartao, textFieldData, textFieldSenhaCartao]

        if Validador().validaTextFields(textFields) {
            pulsar(sender)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController

            controller.pacoteComprado = pacoteSelecionado

            self.navigationController?.pushViewController(controller, animated: true)
        } else {

        }
        
        
    }
    
    @objc func exibeDataTextField(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy"
        self.textFieldData.text = formatador.string(from: sender.date)
    }
    
    @objc func aumentarScroll(notification: Notification) {
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }

}
