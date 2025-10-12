package main

import (
	"crypto/sha256"
	"encoding/hex"
)

type MerkleTree struct {
	leaves []string
	levels [][]string
	root   string
}

func hashFunction(text string) string {
	hash := sha256.Sum256([]byte(text))
	return hex.EncodeToString(hash[:])
}

func newMerkleTree(leaves []string) *MerkleTree {
	if len(leaves) == 0 {
		return &MerkleTree{
			leaves: []string{},
			levels: [][]string{},
			root:   "",
		}
	}
	currentLevel := make([]string, len(leaves))
	for i, d := range leaves {
		currentLevel[i] = hashFunction(d)
	}

	levels := [][]string{currentLevel}

	for len(currentLevel) > 1 {
		var nextLevel []string
		for i := 0; i < len(currentLevel); i += 2 {
			if i+1 < len(currentLevel) {
				nextLevel = append(nextLevel, hashFunction(currentLevel[i]+currentLevel[i+1]))
			} else {
				nextLevel = append(nextLevel, hashFunction(currentLevel[i]+currentLevel[i]))
			}
		}
		levels = append(levels, nextLevel)
		currentLevel = nextLevel
	}
	root := levels[len(levels)-1][0]

	return &MerkleTree{
		leaves: leaves,
		levels: levels,
		root:   root,
	}
}

func (tree *MerkleTree) getRoot() string {
	return tree.root
}
