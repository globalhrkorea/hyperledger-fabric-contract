sudo rm -rf crypto-config channel-artifacts

../bin/cryptogen generate --config=./crypto-config.yaml
export FABRIC_CFG_PATH=$PWD
mkdir channel-artifacts

../bin/configtxgen -profile SampleMultiNodeEtcdRaft -outputBlock ./channel-artifacts/genesis.block -channelID system-channel

../bin/configtxgen -profile MyChannel -outputCreateChannelTx ./channel-artifacts/mychannel.tx -channelID mychannel

../bin/configtxgen -profile MyChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID mychannel -asOrg Org1MSP

../bin/configtxgen -profile MyChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID mychannel -asOrg Org2MSP

../bin/configtxgen -profile MyChannel -outputAnchorPeersUpdate ./channel-artifacts/Org3MSPanchors.tx -channelID mychannel -asOrg Org3MSP

../bin/configtxgen -profile MyChannel -outputAnchorPeersUpdate ./channel-artifacts/Org4MSPanchors.tx -channelID mychannel -asOrg Org4MSP

../bin/configtxgen -profile MyChannel -outputAnchorPeersUpdate ./channel-artifacts/Org5MSPanchors.tx -channelID mychannel -asOrg Org5MSP