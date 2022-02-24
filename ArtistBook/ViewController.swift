import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var artistName  = [String]()
    var artistImage = [UIImage]()
    var selectedArtistName = String()
    var selectedArtistImage = UIImage()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return artistName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = artistName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedArtistName = artistName[indexPath.row]
        selectedArtistImage = artistImage[indexPath.row]
        performSegue(withIdentifier: "toSecondVC", sender: nil )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            
            let destination = segue.destination as! ViewController2
            destination.targetArtistImage = selectedArtistImage
            destination.targetArtistName = selectedArtistName
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            artistName.remove(at: indexPath.row)
            artistImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Artist Book "
        
        tableView.delegate = self
        tableView.dataSource = self
        
        artistName.append("BenFero")
        artistName.append("Ezhel")
        artistName.append("Uzi")
        
        artistImage.append(UIImage(named: "benFero")!)
        artistImage.append(UIImage(named: "ezhel")!)
        artistImage.append(UIImage(named: "uzi")!)
    }
}

