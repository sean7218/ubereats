//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let one = 1
print(one)


//class MyViewController : UIViewController {
//
////    var bannerView: UIView = {
////        let view = UIView()
////        view.translatesAutoresizingMaskIntoConstraints = false
////        view.backgroundColor = .white
////
////        return view
////    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //setupViews()
//    }
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .red
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//
////    func setupViews(){
////        view.addSubview(bannerView)
////        NSLayoutConstraint.activate([
////            bannerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
////            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////            bannerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
////            bannerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
////            bannerView.heightAnchor.constraint(equalToConstant: 80)
////            ])
////    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()
//PlaygroundPage.current.needsIndefiniteExecution = true
