dinosaur_kor = {
    "Iguanodon": "이구아노돈",
    "raptor": "랩터사우르스",
    "trex": "티라노사우르스"
}


class Picture:
    image_bytes: bytes
    dinosaurName: str
    
    # def __init__(self) -> None:
    #     pass

    def normalize(self):
        return {
            "dinosaurName": dinosaur_kor[self.dinosaurName].__str__(),
        }
