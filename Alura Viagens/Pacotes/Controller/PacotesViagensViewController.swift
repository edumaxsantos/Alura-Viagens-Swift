//
//  PacotesViagensViewController.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 09/06/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {

    // MARK: - Outlets
    
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    // MARK: - Propriedades
    
    let listaViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colecaoPacotesViagem.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    // MARK: - DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagens.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        
        let viagemAtual = listaViagens[indexPath.item]
        
        print(celulaPacote.frame.size)
        
        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelPreco.text = "R$ \(viagemAtual.preco)"
        celulaPacote.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        celulaPacote.layer.cornerRadius = 8
        
        return celulaPacote
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
