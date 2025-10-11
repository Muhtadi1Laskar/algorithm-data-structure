import nimcrypto
import sequtils

type 
    MerkleTree = ref object
        leaves: seq[string]
        levels: seq[seq[string]]
        root: string

proc hashData(data: string): string = 
    return toHex(sha256.digest(data).data, lowercase = true)