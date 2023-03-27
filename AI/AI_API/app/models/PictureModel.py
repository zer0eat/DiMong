dinosaur_kor = {
    'Tyrannosaurus': '티라노사우루스',
    'Triceratops': '트리케라톱스',
    'Velociraptor': '벨로시랩터',
    'Parasaurolophus': '파라사우롤로푸스',
    'Iguanodon': '이구아노돈',
    'Pteranodon': '프테라노돈',
    'Ankylosaurus': '안킬로사우루스',
    'Argentinosaurus': '아르헨티노사우루스',
    'Pachycephalosaurus': '파키케팔로사우루스',
    'Elasmosaurus': '엘라스모사우루스',
    'Mosasaurus': '모사사우루스',
    'Ouranosaurus': '오우라노사우루스',
    'Incisivosaurus': '인시시보사우루스',
    'Lambeosaurus': '람베오사우루스',
    'Nodosaurus': '노도사우루스',
    'Oviraptor': '오비랍토르',
    'Quetzalcoatlus': '케찰코아틀루스',
    'Kentrosaurus': '켄트로사우루스',
    'Spinosaurus': '스피노사우루스',
    'Stegosaurus': '스테고사우르스',
    'Brachiosaurus': '브라키오사우루스',
    'Allosaurus': '알로사우루스',
    'Dilophosaurus': '딜로포사우루스',
    'Dacentrurus': '다센트루루스',
    'Tsintaosaurus': '친타오사우루스',
    'Compsognathus': '콤프소그나투스',
    'Giganotosaurus': '기가노토사우루스',
    'Dimorphodon': '디모르포돈',
    'Saurophaganax': '사우로파가낙스',
    'Chasmosaurus': '카스모사우루스',
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
