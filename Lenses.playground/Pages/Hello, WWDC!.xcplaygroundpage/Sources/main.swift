import UIKit
import PlaygroundSupport

public class HelloWWDCView: PhView {
    
    public override func draw(_ rect: CGRect) {
        let realRect = CGRect(x: 5, y: 5, width: rect.width - 10, height: rect.height - 10)
        let topLeftPoint = CGPoint(x: realRect.minX, y: realRect.minY)
        let topOneThirdsPoint = CGPoint(x: realRect.minX + realRect.width / 3, y: realRect.minY)
        let topMidPoint = CGPoint(x: realRect.minX + realRect.width * (2 / 3), y: realRect.minY)
        let topfiveSixthPoint = CGPoint(x: realRect.minX + realRect.width * (5 / 6), y: realRect.minY)
        let bottomLeftPoint = CGPoint(x: realRect.minX, y: realRect.maxY)
        let wSize = CGSize(width: realRect.width / 3, height: realRect.height)
        let cAndDSize = CGSize(width: realRect.width / 6, height: realRect.height)
        drawW_ShapeReflectedLightRays(in: CGRect(origin: topLeftPoint, size: wSize), color: #colorLiteral(red: 0.6112200618, green: 0.7566370368, blue: 0.512727499, alpha: 1))
        drawW_ShapeReflectedLightRays(in: CGRect(origin: topOneThirdsPoint, size: wSize), color: #colorLiteral(red: 0.5765976906, green: 0.2156412303, blue: 0.5111873746, alpha: 1))
        drawD_ShapeLens(in: CGRect(origin: topMidPoint, size: cAndDSize), color: #colorLiteral(red: 0.779101491, green: 0.5823827386, blue: 0.4468529224, alpha: 1))
        drawC_ShapeLens(in: CGRect(origin: topfiveSixthPoint, size: cAndDSize), color: #colorLiteral(red: 0.8451041579, green: 0.2709004581, blue: 0.2850515246, alpha: 1), escape: realRect.height / 10)
        drawMirror(in: CGRect(origin: topLeftPoint.applying(CGAffineTransform(translationX: 0, y: -5)), size: CGSize(width: realRect.width * (2 / 3), height: 5)), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), facingBottom: true)
        drawMirror(in: CGRect(origin: bottomLeftPoint, size: CGSize(width: realRect.width * (2 / 3), height: 5)), color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), facingBottom: false)
    }
    
    private func drawMirror(in rect: CGRect, color: UIColor, facingBottom: Bool = false) {
        let path = UIBezierPath()
        for times in 1...16 {
            let topPoint = CGPoint(x: rect.minX + CGFloat(times) * rect.width / 16, y: rect.minY)
            let bottomPoint = CGPoint(x: rect.minX + CGFloat(times - 1) * rect.width / 16, y: rect.maxY)
            path.move(to: topPoint)
            path.addLine(to: bottomPoint)
        }
        
        if facingBottom {
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        } else {
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }
        
        color.setStroke()
        path.stroke()
    }
    
    private func drawW_ShapeReflectedLightRays(in rect: CGRect, color: UIColor) {
        let topLeftPoint = CGPoint(x: rect.minX, y: rect.minY)
        let topMidPoint = CGPoint(x: rect.midX, y: rect.minY)
        let topRightPoint = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomOneThirdsPoint = CGPoint(x: rect.minX + rect.width / 3, y: rect.maxY)
        let bottomTwoThirdsPoint = CGPoint(x: rect.maxX - rect.width / 3, y: rect.maxY)
        
        drawLight(from: topLeftPoint, to: bottomOneThirdsPoint, color: color)
        drawLight(from: bottomOneThirdsPoint, to: topMidPoint, color: color)
        drawLight(from: topMidPoint, to: bottomTwoThirdsPoint, color: color)
        drawLight(from: bottomTwoThirdsPoint, to: topRightPoint, color: color)
    }
    
    private func drawD_ShapeLens(in rect: CGRect, color: UIColor) {
        let leftTopPoint = CGPoint(x: rect.minX, y: rect.minY)
        let leftMidPoint = CGPoint(x: rect.minX, y: rect.midY)
        let leftBottomPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let path = UIBezierPath(arcCenter: leftMidPoint, radius: rect.height / 2, startAngle: .pi * -0.5, endAngle: .pi / 2, clockwise: true)
        path.move(to: leftTopPoint)
        path.addLine(to: leftBottomPoint)
        color.setStroke()
        path.stroke()
    }
    
    private func drawC_ShapeLens(in rect: CGRect, color: UIColor, escape: CGFloat) {
        let rightTopPoint = CGPoint(x: rect.maxX, y: rect.minY)
        let rightMidPoint = CGPoint(x: rect.maxX, y: rect.midY)
        let rightBottomPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let innerPath = UIBezierPath(arcCenter: rightMidPoint, radius: (rect.height / 2) - escape, startAngle: .pi * -0.5, endAngle: .pi / 2, clockwise: false)
        let outterPath = UIBezierPath(arcCenter: rightMidPoint, radius: rect.height / 2, startAngle: .pi * -0.5, endAngle: .pi / 2, clockwise: false)
        let path = UIBezierPath()
        path.append(innerPath)
        path.append(outterPath)
        path.move(to: rightTopPoint)
        path.addLine(to: rightTopPoint.applying(CGAffineTransform(translationX: 0, y: escape)))
        path.move(to: rightBottomPoint)
        path.addLine(to: rightBottomPoint.applying(CGAffineTransform(translationX: 0, y: -escape)))
        color.setStroke()
        path.stroke()
    }
    
}

public func sayHelloToWWDC() {
    let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 750, height: 250))) // width:height = 3:1
    view.backgroundColor = #colorLiteral(red: 0.1559974253, green: 0.1640306711, blue: 0.2117110193, alpha: 1)
    let wwdcView = HelloWWDCView(frame: view.frame)
    let text = "hello," as NSString
    let attributes:[NSAttributedStringKey:Any] = [.font:UIFont(name: "Zapfino", size: 64) ?? UIFont.systemFont(ofSize: 64),.foregroundColor:#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    let textRect = text.boundingRect(with: CGSize(width: .max, height: .max), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
    let helloView = UILabel(frame: CGRect(x: (view.bounds.width - textRect.width) / 2, y: (view.bounds.height - textRect.height) / 2, width: textRect.width, height: textRect.height))
    helloView.attributedText = NSAttributedString(string: text as String, attributes: attributes)
    helloView.textAlignment = .center
    view.addSubview(helloView)
    helloView.center = view.center
    PlaygroundPage.current.liveView = view
    
    view.addSubview(wwdcView)
    wwdcView.backgroundColor = #colorLiteral(red: 0.1559974253, green: 0.1640306711, blue: 0.2117110193, alpha: 1)
    wwdcView.alpha = 0
    DispatchQueue.global().async {
        sleep(1)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1, animations: {
                let maskView = UIView(frame: wwdcView.bounds)
                maskView.backgroundColor = wwdcView.backgroundColor
                wwdcView.addSubview(maskView)
                UIView.animate(withDuration: 1, animations: {
                    wwdcView.alpha = 1
                }, completion: { _ in
                    UIView.animate(withDuration: 1) {
                        maskView.frame = wwdcView.bounds.applying(CGAffineTransform(translationX: wwdcView.bounds.width, y: 0))
                    }
                })
            })
        }
    }
}
