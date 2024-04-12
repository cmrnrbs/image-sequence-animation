@objc(ImageSequenceAnimationViewManager)
class ImageSequenceAnimationViewManager: RCTViewManager {

  override func view() -> (ImageSequenceAnimationView) {
    return ImageSequenceAnimationView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

class ImageSequenceAnimationView : UIImageView {
  private var _framesPerSecond: UInt = 24
  private var _isReverse: Bool = false
  private var _isFirstStart: Bool = false
  private var activeTasks: [Int: String] = [:]
  private var imagesLoaded: [Int: UIImage] = [:]
  private var isLooping: Bool = false
  private var reverseImages: [UIImage] = []
  private var normalImages: [UIImage] = []

  @objc var images : [Any] = [] {
    didSet{
        self.setImages(self.images)
    }
  }
    
    @objc var loop: Bool = true{
        didSet{
            self.setLoop(self.loop)
        }
    }
    
    @objc var framesPerSecond: UInt = 24{
        didSet{
            self.setFramesPerSecond(self.framesPerSecond)
        }
    }
    
    @objc var reverse: Bool = false{
        didSet{
            self.setReverse(self.reverse)
        }
    }
    
    @objc var isFirstStart: Bool = false{
        didSet{
            self.setFirstStart(self.isFirstStart)
        }
    }

  func setImages(_ images: [Any]) {
        self.animationImages = nil

        activeTasks.removeAll()
        imagesLoaded.removeAll()

        for (index, item) in images.enumerated() {
            guard let dict = item as? [String: Any],
                  let urlString = dict["uri"] as? String else {
                continue
            }

            #if DEBUG
            let url = urlString
            #else
            let url = "file://\(urlString)" // when not in debug, the paths are "local paths" (because resources are bundled in app)
            #endif

            DispatchQueue.global(qos: .userInitiated).async {
                if let imageData = try? Data(contentsOf: URL(string: url)!),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.onImageLoadTaskAtIndex(index, image: image)
                    }
                }
            }

            activeTasks[index] = url
        }
  }

      private func onImageLoadTaskAtIndex(_ index: Int, image: UIImage) {
        if index == 0 {
            self.image = image
        }

        activeTasks.removeValue(forKey: index)
        imagesLoaded[index] = image

        if activeTasks.isEmpty {
            onImagesLoaded()
        }
    }

    private func onImagesLoaded() {
        normalImages.removeAll()
        reverseImages.removeAll()
        for index in 0..<imagesLoaded.count {
            if let image = imagesLoaded[index] {
                normalImages.append(image)
            }
        }

        reverseImages = normalImages.reversed()
        imagesLoaded.removeAll()

        self.image = nil
        self.animationDuration = Double(images.count) / Double(_framesPerSecond)
        self.animationImages = normalImages
        self.animationRepeatCount = isLooping ? 0 : 1
        if !isLooping {
            self.image = !_isReverse ? reverseImages.first : normalImages.first
            
            if _isFirstStart{
                self.image = nil
                self.startAnimating()
                self.image = !_isReverse ? reverseImages.last : normalImages.last
            }
        }else{
            self.startAnimating()
        }
        
        
    }
    
    func setReverse(_ reverse: Bool) {
        self._isReverse = reverse
        if reverse{
            self.animationImages = self._isFirstStart ? normalImages : reverseImages
        }else{
            self.animationImages = !self._isFirstStart ? normalImages : reverseImages
        }
        self.startAnimating()
        
        self.image = self.animationImages != normalImages ? reverseImages.last : normalImages.last
    }

    func setFramesPerSecond(_ framesPerSecond: UInt) {
        self._framesPerSecond = framesPerSecond
    }
    
    func setFirstStart(_ isFirstStart:Bool) {
        self._isFirstStart = isFirstStart
        if isFirstStart{
            self.startAnimating()
        }
    }

    func setLoop(_ loop: Bool) {
        self.isLooping = loop
        self.animationRepeatCount = isLooping ? 0 : 1
    }
}
