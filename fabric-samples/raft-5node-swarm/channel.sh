echo "org1channel 생성"
docker exec cli peer channel create -o orderer.example.com:7050 -c org1channel -f ./channel-artifacts/org1channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
echo "peer0.org1 org1channel 참가"
docker exec cli peer channel join -b org1channel.block
echo "peer1.org1 org1channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org1.example.com:8051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt cli peer channel join -b org1channel.block

echo "org2channel 생성"
docker exec -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer channel create -o orderer.example.com:7050 -c org2channel -f ./channel-artifacts/org2channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
echo "peer0.org2 org2channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer channel join -b org2channel.block
echo "peer1.org2 org2channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org2.example.com:10051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer channel join -b org2channel.block

echo "org3channel 생성"
docker exec -e CORE_PEER_ADDRESS=peer0.org3.example.com:11051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer channel create -o orderer.example.com:7050 -c org3channel -f ./channel-artifacts/org3channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
echo "peer0.org3 org3channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org3.example.com:11051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer channel join -b org3channel.block
echo "peer1.org3 org3channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org3.example.com:12051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer1.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer channel join -b org3channel.block

echo "org4channel 생성"
docker exec -e CORE_PEER_ADDRESS=peer0.org4.example.com:13051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer channel create -o orderer.example.com:7050 -c org4channel -f ./channel-artifacts/org4channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
echo "peer0.org4 org4channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org4.example.com:13051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer channel join -b org4channel.block
echo "peer1.org4 org4channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org4.example.com:14051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer1.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer channel join -b org4channel.block

echo "org5channel 생성"
docker exec -e CORE_PEER_ADDRESS=peer0.org5.example.com:15051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer channel create -o orderer.example.com:7050 -c org5channel -f ./channel-artifacts/org5channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
echo "peer0.org5 org5channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer0.org5.example.com:15051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer channel join -b org5channel.block
echo "peer1.org5 org5channel 참가"
docker exec -e CORE_PEER_ADDRESS=peer1.org5.example.com:16051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer1.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer channel join -b org5channel.block



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



echo "org1channel 체인코드 인스턴스 화"
docker exec cli peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org1channel -n contract -v 1.0 -c '{"Args":[]}' -P "AND('Org1MSP.peer')"
sleep 5

echo "org2channel 체인코드 인스턴스 화"
docker exec -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org2channel -n contract -v 1.0 -c '{"Args":[]}' -P "AND('Org2MSP.peer')"
sleep 5

echo "org3channel 체인코드 인스턴스 화"
docker exec -e CORE_PEER_ADDRESS=peer0.org3.example.com:11051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org3channel -n contract -v 1.0 -c '{"Args":[]}' -P "AND('Org3MSP.peer')"
sleep 5

echo "org4channel 체인코드 인스턴스 화"
docker exec -e CORE_PEER_ADDRESS=peer0.org4.example.com:13051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org4channel -n contract -v 1.0 -c '{"Args":[]}' -P "AND('Org4MSP.peer')"
sleep 5

echo "org5channel 체인코드 인스턴스 화"
docker exec -e CORE_PEER_ADDRESS=peer0.org5.example.com:15051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer chaincode instantiate -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org5channel -n contract -v 1.0 -c '{"Args":[]}' -P "AND('Org5MSP.peer')"
sleep 5



echo "org1channel 체인코드 호출 및 쿼리"
docker exec cli peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org1channel -n contract --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer1.org1.example.com:8051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/ca.crt -c '{"Args":["initLedger"]}'
sleep 5

echo "org2channel 체인코드 호출 및 쿼리"
docker exec -e CORE_PEER_ADDRESS=peer0.org2.example.com:9051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp -e CORE_PEER_LOCALMSPID=Org2MSP cli peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org2channel -n contract --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt --peerAddresses peer1.org2.example.com:10051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/ca.crt -c '{"Args":["initLedger"]}'
sleep 5

echo "org3channel 체인코드 호출 및 쿼리"
docker exec -e CORE_PEER_ADDRESS=peer0.org3.example.com:11051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp -e CORE_PEER_LOCALMSPID=Org3MSP cli peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org3channel -n contract --peerAddresses peer0.org3.example.com:11051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt --peerAddresses peer1.org3.example.com:12051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer1.org3.example.com/tls/ca.crt -c '{"Args":["initLedger"]}'
sleep 5

echo "org4channel 체인코드 호출 및 쿼리"
docker exec -e CORE_PEER_ADDRESS=peer0.org4.example.com:13051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/users/Admin@org4.example.com/msp -e CORE_PEER_LOCALMSPID=Org4MSP cli peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org4channel -n contract --peerAddresses peer0.org4.example.com:13051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer0.org4.example.com/tls/ca.crt --peerAddresses peer1.org4.example.com:14051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org4.example.com/peers/peer1.org4.example.com/tls/ca.crt -c '{"Args":["initLedger"]}'
sleep 5

echo "org5channel 체인코드 호출 및 쿼리"
docker exec -e CORE_PEER_ADDRESS=peer0.org5.example.com:15051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/users/Admin@org5.example.com/msp -e CORE_PEER_LOCALMSPID=Org5MSP cli peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C org5channel -n contract --peerAddresses peer0.org5.example.com:15051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer0.org5.example.com/tls/ca.crt --peerAddresses peer1.org5.example.com:16051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org5.example.com/peers/peer1.org5.example.com/tls/ca.crt -c '{"Args":["initLedger"]}'
sleep 5




# from peer0.org1
docker exec cli peer chaincode query -n contract -C org1channel -c '{"Args":["totalNumberContracts"]}'
sleep 5
