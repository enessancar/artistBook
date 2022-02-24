
import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    
    var targetArtistName = ""
    var targetArtistImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = targetArtistImage
        artistLabel.text = targetArtistName
    }
     



}
