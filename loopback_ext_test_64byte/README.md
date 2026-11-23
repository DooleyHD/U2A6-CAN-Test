# loopback_ext_test_64byte — RH850/U2A6 External CAN FD Loopback Test (Mode 0)

## 출처 및 목적
이 프로젝트는 사용자가 제공한 Renesas `Loopback_test_64byte` 예제(2022년 U2A6 업데이트)를 바탕으로 수정했습니다. 원본 Renesas 소스 파일들의 저작권·면책 고지는 유지했습니다. 소스는 테스트/학습용이며, 컴파일·실기 검증을 마친 양산 코드가 아닙니다.

* 기술 근거: RH850/U2A-EVA User's Manual: Hardware Rev.1.50, Section 23.3.2.2 (`CmCTR`) / Section 23 CANFD Interface.
* 관련 애플리케이션 노트: R01AN4894 Rev.1.11, Section 2.3.1/2.3.3, Figure 2-7/2-9.
* 원본 폴더: `RH850_U2A/ApplicationNotes_WhitePaper/SampleCodes/an-rh850u2a-rscanfd-src/src/Loopback_test_64byte`.

## 핵심 변경

| 내용 | 원본 Mode 1 | Mode 0 수정 |
|---|---|---|
| `CmCTR` 설정 | `0x07000002` | `0x05000002` |
| `CTMS[1:0]` | `11` | `10` |
| `CTME` | 1 | 1 |
| `CHMDC[1:0]` | 10 (Halt) | 10 (Halt) |
| 경로 | MCU 내부 TX→RX | CAN TX 핀→외부 CAN FD Transceiver→CAN RX 핀 |
| 메시지 확인 | 데이터 63바이트만 비교 | 데이터 64바이트 모두 비교 |
| 상태 확인 | `CHLTSTS` 비교값 일부가 잘못됨 | 0/비0 판정으로 수정 |
| 미수신 대기 | 무한 대기 | `10000000`번 반복으로 상한 설정(실시간 타이머 아님) |
| 결과 확인 | 반환값을 main에서 버림 | `g_loopback_ext_test_result`로 디버거에서 확인 가능 |

모드 변경은 `src/r_rh850_can_drv2.c` 의 `R_CAN_Channel_Specific_TestStart()`에서 수행합니다. 원본 대비 전체 패치는 `patches/loopback_ext_mode0.patch`에서 확인할 수 있습니다.

## 하드웨어 연결

```text
RH850/U2A6 CAN0_TX (샘플: P6_14 ALT4) --> CAN FD Transceiver TXD
RH850/U2A6 CAN0_RX (샘플: P6_13 ALT4) <-- CAN FD Transceiver RXD
                                          ┌────────── CAN_H
                  CAN FD Transceiver  ----┤  CAN FD Bus
                                          └────────── CAN_L
```

* 샘플은 **U2A의 논리 CAN0** 한 채널만 사용합니다. PCAN-USB Pro FD의 `CAN1`/`CAN2` 장비 포트 번호와 U2A의 CAN 채널 번호는 독립적입니다.
* 외부 CAN FD 트랜시버의 TXD/RXD/VIO/VCC/GND, STB/EN 핀 상태를 회로도에서 확인하세요. 사진만으로 보드에 트랜시버가 실장되었는지 확인할 수 없습니다.
* 외부 CAN 배선을 구성한다면 버스 양 끝의 120Ω 종단을 확인합니다. 트랜시버 TXD/RXD 전기 연결만으로 즉시 PCAN 시험이 가능한 것은 아닙니다.
* Mode 0은 자체 ACK가 생성되므로 **추가 CAN 노드 없이 자체 송수신 테스트가 가능**하지만, 외부 신호 관찰을 위해 PCAN-USB Pro FD를 모니터로 연결할 수 있습니다.
* 관찰용 PCAN-View는 CAN FD ISO 모드, Nominal 1 Mbps / Data 4 Mbps, SP 약 80%/80%를 기준으로 구성합니다(샘플의 보드 CAN 클록 80 MHz 조건). PCAN 클록 40 MHz와는 별개입니다.
* 송신 프레임: **Standard ID 0x7F0**, CAN FD, DLC 15 = 64 bytes, BRS 설정은 `include/r_rh850_can_tx_table.h`의 `TMD=0x00000006`과 일치하는지 PCAN 트레이스로 확인하세요.
* `R_CAN_Init()` 이후 테스트 모드를 변경하기 전에 Channel Halt 진입과 상태 확인이 완료되어야 합니다.

## 코드 실행 및 확인

1. 기존 CS+/RH850 프로젝트에서 원본 `Loopback_test_64byte`를 복사하여 새 프로젝트로 가져오세요.
2. 본 폴더의 `main0.c`, `src/`, `include/`, `vecttbl0.asm`를 기존 프로젝트의 해당 파일 대신 사용합니다.
3. **주의:** 원본 Google Drive에는 생성된 플랫폼 헤더 `iodefine.h`, 링커 스크립트와 IDE 프로젝트 메타데이터가 포함되어 있지 않습니다. 따라서 이 아카이브만으로 독립적인 빌드는 되지 않으며 기존 U2A6 툴체인의 플랫폼 파일/타깃 설정이 필요합니다.
4. CAN0가 연결된 트랜시버를 정상 동작 모드로 활성화하고, RH850 디버거에서 `main_pm0()`를 실행합니다.
5. Watch 창의 `g_loopback_ext_test_result`가 `CAN_RTN_OK (0)`이면 프레임 데이터 검사가 통과했습니다. `CAN_RTN_ERROR`이면 핀, Transceiver, 버스, Mode 설정, 수신 플래그를 확인합니다.
6. 64바이트 전체 비교와 수신 대기 제한을 적용했지만, 일부 채널/글로벌 모드 전환 대기는 여전히 원본의 무한 폴링입니다. 실사용 전 하드웨어 타이머 기반 timeout으로 개선하세요.

## 품질 및 검증 한계

* 이번 작업은 원본 소스 비교와 레지스터 정의에 대한 **정적 코드 검토**입니다. U2A6 실제 보드에서 빌드 또는 실행·성공을 검증하지 않았습니다.
* 테스트 `Mode 0`과 일반 노드 통신 `Normal Mode`는 다릅니다. PCAN과 상호 송수신을 통한 통신 검증이 목적이면 별도 `Transmit_64byte/Receive_64byte` 예제를 사용하세요.
* 하드웨어 핀 멀티플렉스는 패키지와 실제 보드 회로에 따라 달라집니다.
* 외부 트랜시버 및 종단(대칭적으로 120Ω×2)은 사용자 회로도에 맞춰 검증해야 합니다.
