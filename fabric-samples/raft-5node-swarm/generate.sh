sudo rm -rf crypto-config channel-artifacts

../bin/cryptogen generate --config=./crypto-config.yaml
export FABRIC_CFG_PATH=$PWD
mkdir channel-artifacts

../bin/configtxgen -profile SampleMultiNodeEtcdRaft -outputBlock ./channel-artifacts/genesis.block -channelID system-channel

../bin/configtxgen -profile Org1Channel -outputCreateChannelTx ./channel-artifacts/org1channel.tx -channelID org1channel

../bin/configtxgen -profile Org1Channel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID org1channel -asOrg Org1MSP

../bin/configtxgen -profile Org2Channel -outputCreateChannelTx ./channel-artifacts/org2channel.tx -channelID org2channel

../bin/configtxgen -profile Org2Channel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID org2channel -asOrg Org2MSP

../bin/configtxgen -profile Org3Channel -outputCreateChannelTx ./channel-artifacts/org3channel.tx -channelID org3channel

../bin/configtxgen -profile Org3Channel -outputAnchorPeersUpdate ./channel-artifacts/Org3MSPanchors.tx -channelID org3channel -asOrg Org3MSP

../bin/configtxgen -profile Org4Channel -outputCreateChannelTx ./channel-artifacts/org4channel.tx -channelID org4channel

../bin/configtxgen -profile Org4Channel -outputAnchorPeersUpdate ./channel-artifacts/Org4MSPanchors.tx -channelID org4channel -asOrg Org4MSP

../bin/configtxgen -profile Org5Channel -outputCreateChannelTx ./channel-artifacts/org5channel.tx -channelID org5channel

../bin/configtxgen -profile Org5Channel -outputAnchorPeersUpdate ./channel-artifacts/Org5MSPanchors.tx -channelID org5channel -asOrg Org5MSP