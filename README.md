# hoa-about-hanRIver

#한강물 수온 체크 어플

## 목적
사진촬영을 좋아해서 한강 근처 촬영지 및 사람 분포를 실시간으로 알고싶어서 제작


## 문제점
현재 api 불러오는 과정에서
![image](https://user-images.githubusercontent.com/78361650/163337389-eb58fca2-e265-4735-99f2-746a667c7bfd.png)
api호출은 가능하나 decoder로 변환해 필요데이터 호출하는 부분에서 문제를 찾았다.

1. json구조를 전부구현하지 않은 struct의 문제
2. decodeing 중의 문제 

이 두개중 하나인데 아마 1번의 확률이 99%라고 생각된다.
enum파트를 조금 고민해보고 다시 짜봐야 겠다.
