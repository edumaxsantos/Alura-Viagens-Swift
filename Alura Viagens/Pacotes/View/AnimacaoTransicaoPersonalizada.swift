//
//  AnimacaoTransicaoPersonalizada.swift
//  Alura Viagens
//
//  Created by Eduardo Santos on 27/06/21.
//

import UIKit

class AnimacaoTransicaoPersonalizada: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    // MARK: - Atributos
    
    private var duracao: TimeInterval
    private var imagem: UIImage
    private var frameInicial: CGRect
    
    // MARK: - Inicializador
    
    init(duracao: TimeInterval, imagem: UIImage, frameInicial: CGRect) {
        self.duracao = duracao
        self.imagem = imagem
        self.frameInicial = frameInicial
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duracao
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let viewFinal = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        guard let imagemDaViagem = viewFinal.viewWithTag(1) as? UIImageView else { return }
        imagemDaViagem.image = imagem
        
        let imagemDeTransicao = UIImageView(frame: frameInicial)
        imagemDeTransicao.image = imagem
        
        let contexto = transitionContext.containerView
        contexto.addSubview(viewFinal)
        contexto.addSubview(imagemDeTransicao)
        
        UIView.animate(withDuration: duracao) {
            imagemDeTransicao.frame = imagemDaViagem.frame
        } completion: { (_) in
            imagemDeTransicao.removeFromSuperview()
            transitionContext.completeTransition(true)
        }

        
        
    }
    

}
