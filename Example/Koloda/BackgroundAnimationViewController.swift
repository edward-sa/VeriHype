

import UIKit
import Koloda
import pop


private let numberOfCards: Int = 3
private let frameAnimationSpringBounciness: CGFloat = 9
private let frameAnimationSpringSpeed: CGFloat = 16
private let kolodaCountOfVisibleCards = 1
private let kolodaAlphaValueSemiTransparent: CGFloat = 0.1

class BackgroundAnimationViewController: UIViewController {
    
    var category: String = ""
    var realornah = false
    var correcta = 0

    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var kolodaView: CustomKolodaView!

    
    //MARK: Lifecycle
    override func viewDidLoad() {
       
        super.viewDidLoad()
        kolodaView.alphaValueSemiTransparent = kolodaAlphaValueSemiTransparent
        kolodaView.countOfVisibleCards = kolodaCountOfVisibleCards
        kolodaView.delegate = self
        kolodaView.dataSource = self
        kolodaView.animator = BackgroundKolodaAnimator(koloda: kolodaView)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        topview.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    }
    
    
    //MARK: IBActions
    @IBAction func leftButtonTapped() {
        if !realornah{
            correcta = correcta + 1
            

        
        }
        
        kolodaView?.swipe(.left)
    }
    
    @IBAction func rightButtonTapped() {
        if realornah{
            correcta = correcta + 1
         
        }
       
        kolodaView?.swipe(.right)
    }
    
    @IBAction func undoButtonTapped() {
        kolodaView?.revertAction()
    }
}

//MARK: KolodaViewDelegate
extension BackgroundAnimationViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {

        kolodaView.resetCurrentCardIndex()
        performSegue(withIdentifier: "endgameSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "endgameSegue" {
                
                if let dest = segue.destination as? ScoreViewController {
                    dest.score = correcta
                }
            }}
        
    }
    
   
    
    func kolodaShouldApplyAppearAnimation(_ koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldMoveBackgroundCard(_ koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaShouldTransparentizeNextCard(_ koloda: KolodaView) -> Bool {
        return true
    }
    
    func koloda(kolodaBackgroundCardAnimation koloda: KolodaView) -> POPPropertyAnimation? {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        animation?.springBounciness = frameAnimationSpringBounciness
        animation?.springSpeed = frameAnimationSpringSpeed
        return animation
    }
}

// MARK: KolodaViewDataSource
extension BackgroundAnimationViewController: KolodaViewDataSource {
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return numberOfCards
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let real = arc4random_uniform(2)
        //if let category = category{
            //print(category + String(index))
        //}
        if real == 1 {
            realornah = true
            return UIImageView(image: UIImage(named: category + String(index) + "real"))
            
        } else {
            realornah = false
            return UIImageView(image: UIImage(named: category + String(index) + "fake"))
        }
       
        //return UIImageView(image: UIImage(named: "cards_\(index + 1)"))
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("CustomOverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}
