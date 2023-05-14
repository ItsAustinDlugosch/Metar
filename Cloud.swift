struct Cloud {
    let baseAGL: Int
    let cover: String        
    
    init?(baseAGL: Int?, cover: String) {
        if let baseAGL = baseAGL, cover.count > 0 {
            self.baseAGL = baseAGL
            self.cover = cover
        } else {
            return nil
        }            
    }
}
