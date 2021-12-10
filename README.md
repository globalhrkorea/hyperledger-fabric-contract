# 하이퍼레저 패브릭 스마트 계약
하이퍼레저 패브릭 스마트 계약은 네트워크 상 계약서를 주고 받을 때 발생할 수 있는 데이터의 위조, 변조에 대한 문제를 분산형 데이터 저장 기술을 사용하는 블록체인 기술로 데이터의 보안성 및 신뢰성, 무결성 보증한다.

## 목적
디지털 프레임워크 블록체인 기술을 사용하여 만든 프로토타입을 기반으로 실제 사용할 서비스에 대한 체인코드를 개발 및 구현할 수 있다.

##  네트워크 구성

![image](https://user-images.githubusercontent.com/96213780/146294228-fa5118be-c18c-4fb4-bb0a-69e45aa48d21.png)

RAFT Ordering Service를 사용하기 위해, AWS EC2에서 인스턴스 5개 생성. 각 인스턴스는 블록체인 노드가 된다.

HOST1 : Orderer1, CA, peer0.org1, msp, couchdb, 웹 클라이언트 서버, cli </br>
HOST2 : Orderer2, CA, peer0.org2, msp, couchdb, 웹 백엔드 서버 </br>
HOST3 : Orderer3, CA, peer0.org3, msp, couchdb </br>
HOST4 : Orderer4, CA, peer0.org4, msp, couchdb </br>
HOST5 : Orderer5, CA, peer0.org5, msp, couchdb </br>
5개의 조직이 한 채널에 연결되어 있다.

## 환경설정
### 운영체제
Ubuntu LTS 20.04
### 유틸리티
|이름|버전|
|---|---|
|Golang|1.14 이상|
|Git|최신버전|
|cURL|최신버전|
|Nodejs|v8 이상|
|Build-essential|최신버전|
|jq|최신버전|
|Golang|1.14 이상|
|Docker|17.06.2-ce 이상|
|docker-compose|최신버전|
|MongoDB|최신버전|






## 설치
GO 언어 설치
```
sudo wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz
```

nvm 설치
```
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
```

angular 설치
```
npm install -g @angular/cli
```

jq 설치
```
sudo apt install jq
```

docker 설치
```
sudo apt install docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker ubuntu
sudo su - ubuntu
```

docker-compose 설치
```
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose -version 
```


## 실행 방법
#### 1. docker-compose를 사용하여 모든 호스트를 불러온다.
![image](https://user-images.githubusercontent.com/96213780/146293969-eb23fb23-60ed-4c19-9d98-570ab95bd435.png)

```
# host 1, 2, 3, 4, 5에서 해당 yaml 파일을 불러온다.
 docker-compose -f host1~5.yaml up -d
```

#### 2. 채널을 만들고 모든 Peer Node 결합
HOST1 에 CLI가 있으므로 모든 명령은 HOST1 터미널에서 실행된다. </br>
mychannel 에 대한 채널 생성 블록을 생성
```
docker exec cli peer channel create -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
```

mychannel에 peer0.org1~5 가입
```
docker exec cli peer channel join -b mychannel.block


docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_ADDRESS=peer0.org2.example.com:8051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt cli peer channel join -b mychannel.block


docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_ADDRESS=peer0.org3.example.com:9051 -e CORE_PEER_LOCALMSPID="Org3MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt cli peer channel join -b mychannel.block


docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_ADDRESS=peer0.org4.example.com:10051 -e CORE_PEER_LOCALMSPID="Org4MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt cli peer channel join -b mychannel.block


docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_ADDRESS=peer0.org5.example.com:11051 -e CORE_PEER_LOCALMSPID="Org5MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt cli peer channel join -b mychannel.block
```


#### 3. 체인코드 설치 및 인스턴스화
모든 피어 노드에 체인코드 설치
```
docker exec cli peer chaincode install -n fabcar -v 1.0 -p github.com/chaincode/fabcar/go/


docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_ADDRESS=peer0.org2.example.com:8051 -e CORE_PEER_LOCALMSPID="Org2MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt cli peer chaincode install -n fabcar -v 1.0 -p github.com/chaincode/fabcar/go/


docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_ADDRESS=peer0.org3.example.com:9051 -e CORE_PEER_LOCALMSPID="Org3MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt cli peer chaincode install -n fabcar -v 1.0 -p github.com/chaincode/fabcar/go/


docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_ADDRESS=peer0.org4.example.com:10051 -e CORE_PEER_LOCALMSPID="Org4MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt cli peer chaincode install -n fabcar -v 1.0 -p github.com/chaincode/fabcar/go/



docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_ADDRESS=peer0.org5.example.com:11051 -e CORE_PEER_LOCALMSPID="Org5MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt cli peer chaincode install -n fabcar -v 1.0 -p github.com/chaincode/fabcar/go/
```

mychannel에 체인코드를 인스턴스화
```
docker exec cli peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n fabcar -v 1.0 -c '{"Args":[]}' -P "OutOf (3, 'Org1MSP.peer', 'Org2MSP.peer', 'Org3MSP.peer', 'Org4MSP.peer', 'Org5MSP.peer')"
```


#### 4. 체인코드 호출 및 쿼리
```
docker exec cli peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n fabcar --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:8051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt --peerAddresses peer0.org3.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt --peerAddresses peer0.org4.example.com:10051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt --peerAddresses peer0.org5.example.com:11051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -c '{"Args":["initLedger"]}'
```


(선택사항) 그 후 4개의 Peer Node에서 쿼리할 수 있다. 이것은 패브릭 네트워크가 잘 작동하고 있음을 보여준다.
```
# from peer0.org1
docker exec cli peer chaincode query -n fabcar -C mychannel -c '{"Args":["queryCar","CAR0"]}'

# from peer0.org2
docker exec -e CORE_PEER_ADDRESS=peer0.org2.example.com:8051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt cli peer chaincode query -n fabcar -C mychannel -c '{"Args":["queryCar","CAR0"]}'

# from peer0.org3
docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_ADDRESS=peer0.org3.example.com:9051 -e CORE_PEER_LOCALMSPID="Org3MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt cli peer chaincode query -n fabcar -C mychannel -c '{"Args":["queryCar","CAR0"]}'

# from peer0.org4
docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_ADDRESS=peer0.org4.example.com:10051 -e CORE_PEER_LOCALMSPID="Org4MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt cli peer chaincode query -n fabcar -C mychannel -c '{"Args":["queryCar","CAR0"]}'

# from peer0.org5
docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_ADDRESS=peer0.org5.example.com:11051 -e CORE_PEER_LOCALMSPID="Org5MSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org4.example.com/tls/ca.crt cli peer chaincode query -n fabcar -C mychannel -c '{"Args":["queryCar","CAR0"]}'
```

#### 5. 종료
```
# 각 Host
 docker-compose -f host n .yaml down -v
```

ddfdfdddaa