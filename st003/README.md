# Readme

## Package Info

- Publish: `sui client publish --gas-budget 30000000 --skip-dependency-verification`
- Digest: AsRfzMPfaibN1ziFsnMAMPnHB3F1E4EHKXSm5gBvefoh
- Package: 0x79db1ef58c455db20236e6ee19daacd9c17f840b3b9617dc2ec3cf58df28cdfc

| FistName | Object ID                                                          |
| -------- | ------------------------------------------------------------------ |
| stone    | 0xef59ab7f4c7f004fb1ac9dc6b6c018c91ec4fbb83e43c2828a6f02e1bce0f578 |
| paper    | 0xf62ea7cf00a4297b579ecc9cd4132ff74094c95a74bffb7a0d47d199903368bf |
| scissors | 0x89ebccbde1eb629d5b706a57795be97c4c3bb7d4f6f4a9cc0d8b23bebd3109d5 |

## How to play with

call `make_fist(fist_id, oracle_id)`

```bash
sui client call --package 0x79db1ef58c455db20236e6ee19daacd9c17f840b3b9617dc2ec3cf58df28cdfc --module game --function make_fist --args 0xf62ea7cf00a4297b579ecc9cd4132ff74094c95a74bffb7a0d47d199903368bf 0x1aedcca0b67b891c64ca113fce87f89835236b4c77294ba7e2db534ad49a58dc  --gas-budget 3000000 
```

query record obj to get result:

```bash
HRePSVGBqauaGiyiEn2wMhPBPf6tZ3EjpaUKSvniobEo

sui client object 0xf14b1c071a2e7dafa9aa91767845c0c864d2e8c0f70400ce5be8ab6b3949bfec
```

from the record we can get the result:

```bash
╭───────────────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ objectId      │  0xf14b1c071a2e7dafa9aa91767845c0c864d2e8c0f70400ce5be8ab6b3949bfec                                                  │
│ version       │  38707341                                                                                                            │
│ digest        │  8vKDkTbk8NrBUELZ4rx8A5kFbsMSc15FuWGD98brzLyC                                                                        │
│ objType       │  0x79db1ef58c455db20236e6ee19daacd9c17f840b3b9617dc2ec3cf58df28cdfc::game::Record                                    │
│ ownerType     │  AddressOwner                                                                                                        │
│ prevTx        │  HRePSVGBqauaGiyiEn2wMhPBPf6tZ3EjpaUKSvniobEo                                                                        │
│ storageRebate │  1390800                                                                                                             │
│ content       │ ╭───────────────────┬──────────────────────────────────────────────────────────────────────────────────────────────╮ │
│               │ │ dataType          │  moveObject                                                                                  │ │
│               │ │ type              │  0x79db1ef58c455db20236e6ee19daacd9c17f840b3b9617dc2ec3cf58df28cdfc::game::Record            │ │
│               │ │ hasPublicTransfer │  false                                                                                       │ │
│               │ │ fields            │ ╭──────────┬───────────────────────────────────────────────────────────────────────────────╮ │ │
│               │ │                   │ │ id       │ ╭────┬──────────────────────────────────────────────────────────────────────╮ │ │ │
│               │ │                   │ │          │ │ id │  0xf14b1c071a2e7dafa9aa91767845c0c864d2e8c0f70400ce5be8ab6b3949bfec  │ │ │ │
│               │ │                   │ │          │ ╰────┴──────────────────────────────────────────────────────────────────────╯ │ │ │
│               │ │                   │ │ opponent │  stone                                                                        │ │ │
│               │ │                   │ │ player   │  paper                                                                        │ │ │
│               │ │                   │ │ result   │  win                                                                          │ │ │
│               │ │                   │ ╰──────────┴───────────────────────────────────────────────────────────────────────────────╯ │ │
│               │ ╰───────────────────┴──────────────────────────────────────────────────────────────────────────────────────────────╯ │
╰───────────────┴──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```
