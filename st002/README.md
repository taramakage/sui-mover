# Readme

## Testnet

publish package:

- digest: CP1sueJ7Ynv4BfPze4Pe2vqq4JNEVzq7rMz98kntYEV
- pkg-id: 0xee23d4dc69c7126c13d5dda142bedd33df0061ed7045ca1be10b1701c6ebc3c7
- module-name: nft

call mint func:

```bash
sui client call --package 0xee23d4dc69c7126c13d5dda142bedd33df0061ed7045ca1be10b1701c6ebc3c7 --module nft --function mint --args 0x95eb8ebcf0d051d0ecc95a481818a1bdeb7c1262f4fa7616513ed12dd3fb2c1f 0x5e9572b97f593399721cbc4da432900b3f20f43356c647dc193ab71a03ca0184 "taramakage" "test-mint-token" "https://avatars.githubusercontent.com/taramakage" --gas-budget 1000000 
```

- digest: hzTH4j9tK46Tzfu6Ww3unaMNu9HeKcUUmxQ9Mh5m4mD
- token-obj-id: 0x79dc2991fc4adf14bd732fe3d658580692ffedcce7b49c47a412308bdea58d98

## Mainnet

publish package:

- digest: 7NsHHaDKmjFD6ngujDTMoENmK5MGvX2vybUL6vVLbCWt
- pkg-id: 0x3e34b667499adccce82cca907d2f5d2d3ba8cf8bc1384e0e86de359cda6e206f

```bash
call mint func:

```bash
sui client call --package 0x3e34b667499adccce82cca907d2f5d2d3ba8cf8bc1384e0e86de359cda6e206f --module nft --function mint --args 0x93f825a235049ea91e301314f4be08fc4245d9bf416888b1e7f44054a1536567 0x5e9572b97f593399721cbc4da432900b3f20f43356c647dc193ab71a03ca0184 "taramakage" "sui-startrek-stage2-task" "https://avatars.githubusercontent.com/taramakage" --gas-budget 3000000 
```

- digest: Efc9pkPMG9yN3HaySXpEFNNEF2rPtzpYuSCo7K15DJJp
- token-obj-id: 0xca1be21c2eeb2964e5d13dabe110626eadfdcbebc54dd165333ef0a0a7fff1fa
