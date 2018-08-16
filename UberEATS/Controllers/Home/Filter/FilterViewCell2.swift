//
//  PriceRange.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/30/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

// Credit to Peter Kreinz for this one (see link in tutorial)
extension UIImage {
    func alpha(_ value:CGFloat)->UIImage?
    {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

class DollarButton: UIButton {
    
    //    let button = UIButton(type: .custom)
    //    button.translatesAutoresizingMaskIntoConstraints = false
    //    button.setImage(#imageLiteral(resourceName: "button-filter").withRenderingMode(.alwaysTemplate), for: .normal)
    //    button.backgroundColor = UIColor(red: 240/255, green: 237/255, blue: 240/255, alpha: 1)
    //    button.imageView?.contentMode = .scaleAspectFit
    //    button.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
    //    button.tintColor = .black
    //    button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    //    button.clipsToBounds = true
    //    button.layer.cornerRadius = button.layer.frame.height/2
    //    button.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        self.setImage(image, for: UIControlState.normal)
        let imageHighlight = image.alpha(0.3)?.withRenderingMode(.alwaysTemplate)
        self.setImage(imageHighlight, for: UIControlState.highlighted)
        configure()
    }
    
    convenience init(frame: CGRect, title: String) {
        self.init(frame: frame)
        self.setTitle(title, for: UIControlState.normal)
        

        configure()
    }
    
    func configure() {
        self.imageView?.contentMode = .scaleAspectFit
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.frame.height/2
        self.setTitleColor(UIColor.black, for: UIControlState.normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure button when bounds change since image inset has dependency on bounds
    override public var bounds: CGRect{
        didSet{
            configure()
        }
    }
    override var isSelected: Bool {
        didSet {
            print("isSelected: \(isSelected)")
            if (isSelected) {
                self.backgroundColor = .black
                self.setTitleColor(UIColor.white, for: UIControlState.selected)
            } else {
                self.backgroundColor = .white
                self.setTitleColor(UIColor.black, for: UIControlState.normal)
            }
        }
    }
}
class FilterViewCell2: UICollectionViewCell {
    
    var priceRangeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        label.text = "Price Range"
        return label
    }()
    
    @objc func touchedDollar(_ sender:UIButton){
        sender.isSelected = (sender.isSelected == true) ? false : true
        print("DollorButton Pressed")
    }
    lazy var priceRangeView: UIStackView = {
        let button1 = DollarButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), title: "$")
        let button2 = DollarButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), title: "$$")
        let button3 = DollarButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), title: "$$$")
        let button4 = DollarButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), title: "$$$$")
        button1.addTarget(self, action: #selector(touchedDollar(_:)), for: UIControlEvents.touchUpInside)
        button2.addTarget(self, action: #selector(touchedDollar(_:)), for: UIControlEvents.touchUpInside)
        button3.addTarget(self, action: #selector(touchedDollar(_:)), for: UIControlEvents.touchUpInside)
        button4.addTarget(self, action: #selector(touchedDollar(_:)), for: UIControlEvents.touchUpInside)
        let view = UIStackView(arrangedSubviews: [button1, button2, button3, button4])
        view.distribution = UIStackViewDistribution.fillEqually
        view.spacing = 10
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var bookingFeeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        label.text = "Max Booking Fee"
        return label
    }()
    
    lazy var slideButtonView: UISlider = {
        let slider = UISlider(frame: CGRect.zero)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.isContinuous = true
        slider.maximumValue = 7
        slider.minimumValue = 4
        slider.addTarget(self, action: #selector(sliderValueChange(_:)), for: UIControlEvents.touchDragExit)
        return slider
    }()
    
    @objc func sliderValueChange(_ sender: UISlider){
        let point = roundf(sender.value)
        print(point)
        UIView.animate(withDuration: 0.1) {
            sender.setValue(point, animated: true)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        addSubview(priceRangeLabel)
        NSLayoutConstraint.activate([
            priceRangeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            priceRangeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            priceRangeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            priceRangeLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(priceRangeView)
        NSLayoutConstraint.activate([
            priceRangeView.topAnchor.constraint(equalTo: priceRangeLabel.bottomAnchor, constant: 10),
            priceRangeView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            priceRangeView.widthAnchor.constraint(equalToConstant: 230),
            priceRangeView.heightAnchor.constraint(equalToConstant: 50)
            ])
        addSubview(bookingFeeLabel)
        NSLayoutConstraint.activate([
            bookingFeeLabel.topAnchor.constraint(equalTo: priceRangeView.bottomAnchor, constant: 10),
            bookingFeeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            bookingFeeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            bookingFeeLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        addSubview(slideButtonView)
        NSLayoutConstraint.activate([
            slideButtonView.topAnchor.constraint(equalTo: bookingFeeLabel.bottomAnchor, constant: 10),
            slideButtonView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            slideButtonView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            slideButtonView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
