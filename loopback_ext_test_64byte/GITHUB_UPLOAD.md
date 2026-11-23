# GitHub 업로드 안내

현재 GitHub 계정/저장소가 이 ChatGPT 대화에 연결되어 있지 않아 원격 저장소에 Push하지 않았습니다.
Claude에서 이미 사용 중인 GitHub 연결은 ChatGPT 대화와 별도입니다.

다음은 본 프로젝트 폴더를 **본인이 쓰기 권한을 가진 저장소**에 올릴 때의 예시입니다.

```bash
# 기존 저장소를 clone 후 원하는 부모 디렉터리로 이 폴더를 복사하세요.
git add loopback_ext_test_64byte
git commit -m "Add RH850 U2A6 external CAN FD loopback mode 0 test"
git push
```

원격 GitHub 저장소 URL이 `https://github.com/`이라는 사이트 루트만 제시되어 있어, 대상 owner/repository를 특정할 수 없습니다.

원본 소스의 Renesas 라이선스·저작권 및 공개 범위에 대한 허가를 확인한 뒤 Private 저장소를 권장합니다.
