import UIKit
import AVFoundation

class ViewController: UIViewController {
    var mydic = ["Soft": 3, "Medium": 40, "Hard": 7]
    var counter = 60
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    var player: AVAudioPlayer?
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var remainingProgress: UIProgressView!
    
    @IBAction func eggButtons(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = Float(mydic[hardness]!)
        remainingProgress.progress = 0.0
        secondsPassed = 0
        textLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {

        if secondsPassed < totalTime {
            secondsPassed += 1
            let cal = secondsPassed / totalTime
            print(cal)
            remainingProgress.progress = cal
        }else {
            timer.invalidate()
            textLabel.text = "It's time to eat"
            playSound()
        }

    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}
