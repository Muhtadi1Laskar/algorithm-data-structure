package main

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

func hashFunction(text string) string {
	byteMessage := []byte(text)
	hash := sha256.New()
	hash.Write(byteMessage)

	hashedBytes := hash.Sum(nil)

	return hex.EncodeToString(hashedBytes)
}

type MerkleTree struct {
	leaves []string
	levels [][]string
	root string
}

func (tree *MerkleTree) build(leaves []string) [][]string {
	if len(leaves) == 0 {
		return [][]string{}
	}
	var levels [][]string = [][]string{leaves}
	var currentLevel []string = leaves

	for len(currentLevel) > 0 {
		var nextLevel []string = []string{}
		for i := 0; i < len(currentLevel) - 1; i += 2 {
			if i + 1 < len(currentLevel) {
				hash := hashFunction(currentLevel[i] + currentLevel[i+1])
				nextLevel = append(nextLevel, hash)
			} else {
				nextLevel = append(nextLevel, hashFunction(currentLevel[i] + currentLevel[i]))
			}
		}
		levels = append(levels, nextLevel)
		currentLevel = nextLevel
	}
	return levels
}

func newMerkleTree(leaves []string) *MerkleTree {
	tree := &MerkleTree{leaves: leaves} 
	tree.levels = tree.build(leaves)
	
	if len(leaves) > 0 {
		tree.root = tree.levels[len(tree.levels)][0]
	}
	return tree
}

func main() {
	var data string = "This is a text"

	fmt.Println(hashFunction(data))
}
