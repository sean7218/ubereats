//
//  PriceRange.swift
//  UberEATS
//
//  Created by Sean Zhang on 11/30/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class FilterViewCell2: UICollectionViewCell {
    
    var delegate: FilterSelectDelegate?
    
    var priceRangeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        label.text = "Price Range"
        return label
    }()
    
    @objc func touchedDollar(_ sender:UIButton){
        sender.isSelected = (sender.isSelected == true) ? false : true
        delegate?.selected(section: 1, row: 0)
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
