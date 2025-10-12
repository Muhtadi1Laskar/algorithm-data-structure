import nimcrypto
import sequtils

type 
    MerkleTree = ref object
        leaves: seq[string]
        levels: seq[seq[string]]
        root: string

proc hashData(data: string): string = 
    return toHex(sha256.digest(data).data, lowercase = true)

proc build(leaves: seq[string]): seq[seq[string]] = 
    if len(leaves) == 0:
        return @[]

    var levels: seq[seq[string]] = @[leaves]
    var currentLevel: seq[string] = leaves.mapIt(hashData(it))
    levels.add(currentLevel)

    while 1 < currentLevel.len:
        var nextLevel: seq[string] = @[]

        for i in countup(0, currentLevel.len - 1, 2):
            if i + 1 < currentLevel.len:
                nextLevel.add(hashData(currentLevel[i] & currentLevel[i+1]))
            else:
                nextLevel.add(hashData(currentLevel[i] & currentLevel[i]))
        
        levels.add(nextLevel)
        currentLevel = nextLevel
    
    return levels

proc getRoot(self: MerkleTree): string = 
    return self.root


proc newMerkleTree(leaves: seq[string]): MerkleTree = 
    var tree: MerkleTree = MerkleTree(leaves: leaves)

    tree.levels = build(leaves)

    if tree.levels.len > 0 and tree.levels[^1].len > 0:
        tree.root = tree.levels[^1][0]
    else:
        tree.root = ""
        
    return tree

when isMainModule:
    let data: seq[string] = @[
        "Blockchain ensures data integrity through consensus.",
        "Merkle trees allow efficient verification of data chunks.",
        "Each leaf node represents a hashed data block.",
        "Parent nodes store hashes of their children.",
        "The root hash summarizes the entire dataset."
    ]

    var tree: MerkleTree = MerkleTree(data)

    echo "\n Root Hash: ", tree.getRoot()