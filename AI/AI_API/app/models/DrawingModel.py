dinosaur_kor = {
    "Iguanodon": "이구아노돈",
    "raptor": "랩터사우르스",
    "trex": "티라노사우르스",
}


class Drawing:
    image_bytes: bytes
    dinosaurName1: str
    dinosaurName2: str
    dinosaurName3: str

    
    # def __init__(self) -> None:
    #     pass

    def normalize(self):
        return {
            "dinosaurName1": dinosaur_kor[self.dinosaurName1].__str__(),
            "dinosaurName2": dinosaur_kor[self.dinosaurName2].__str__(),
            "dinosaurName3": dinosaur_kor[self.dinosaurName3].__str__(),
        }
