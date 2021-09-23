echo "mychannel 생성"
docker exec cli peer channel create -o orderer.example.com:7050 -c mychannel -f ./channel-artifacts/mychannel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
echo "peer0.org1 mychannel 참가"
docker exec cli peer channel join -b mychannel.block
echo "peer1.org1 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org1.example.com:8051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt cli peer channel join -b mychannel.block

echo "peer0.org2 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer channel join -b mychannel.block
echo "peer1.org2 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org2.example.com:10051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer channel join -b mychannel.block

echo "peer0.org3 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org3.example.com:11051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer channel join -b mychannel.block
echo "peer1.org3 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org3.example.com:12051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer1.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer channel join -b mychannel.block

echo "peer0.org4 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org4.example.com:13051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer channel join -b mychannel.block
echo "peer1.org4 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org4.example.com:14051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer1.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer channel join -b mychannel.block

echo "peer0.org5 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org5.example.com:15051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer channel join -b mychannel.block
echo "peer1.org5 mychannel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org5.example.com:16051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer1.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer channel join -b mychannel.block

echo "체인코드 peer0.org1에 설치"
docker exec cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer1.org1에 설치"
docker exec -e CORE_PEER_ADDRESS=peer1.org1.example.com:8051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp -e CORE_PEER_LOCALMSPID=Org1MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer0.org2에 설치"
docker exec -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer1.org2에 설치"
docker exec -e CORE_PEER_ADDRESS=peer1.org2.example.com:10051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer0.org3에 설치"
docker exec -e CORE_PEER_ADDRESS=peer0.org3.example.com:11051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer1.org3에 설치"
docker exec -e CORE_PEER_ADDRESS=peer1.org3.example.com:12051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer1.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer0.org4에 설치"
docker exec -e CORE_PEER_ADDRESS=peer0.org4.example.com:13051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer1.org4에 설치"
docker exec -e CORE_PEER_ADDRESS=peer1.org4.example.com:14051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer1.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer0.org5에 설치"
docker exec -e CORE_PEER_ADDRESS=peer0.org5.example.com:15051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5

echo "체인코드 peer1.org5에 설치"
docker exec -e CORE_PEER_ADDRESS=peer1.org5.example.com:16051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer1.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer chaincode install -n contract -v 1.0 -p github.com/chaincode/contract/go/
sleep 5



echo "mychannel 체인코드 인스턴스 화"
docker exec cli peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n contract -v 1.0 -c '{"Args":[]}' -P "OutOf (3, 'Org1MSP.peer', 'Org2MSP.peer', 'Org3MSP.peer', 'Org4MSP.peer', 'Org5MSP.peer')"
sleep 5



echo "mychannel 체인코드 호출 및 쿼리"
docker exec cli peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n contract --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt --peerAddresses peer0.org3.example.com:11051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt --peerAddresses peer0.org4.example.com:13051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt --peerAddresses peer0.org5.example.com:15051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -c '{"Args":["initLedger"]}'
sleep 5




# from peer0.org1
docker exec cli peer chaincode query -n contract -C mychannel -c '{"Args":["totalNumberContracts"]}'
sleep 5
