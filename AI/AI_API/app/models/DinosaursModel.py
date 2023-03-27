class Dinosaurs:
    audioSrc: str

    # def __init__(self) -> None:
    #     pass

    def normalize(self):
        return {
            "audioSrc": self.audioSrc.__str__(),
        }
