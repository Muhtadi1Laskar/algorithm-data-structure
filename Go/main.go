package main

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
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

func mapHash(data []string) []string {
	var hashes []string = make([]string, len(data))
	for i := 0; i < len(data); i++ {
		hashes[i] = hashFunction(data[i])
	}
	return hashes
}

func newMerkleTree(leaves []string) *MerkleTree {
	tree := &MerkleTree{leaves: leaves}
	tree.levels = tree.build(leaves)
	tree.root = tree.levels[len(tree.levels)-1][0]
	return tree
}

func (tree *MerkleTree) build(leaves []string) [][]string {
	if len(leaves) == 0 {
		return [][]string{}
	}
	var levels [][]string = [][]string{leaves}
	var currentLevel []string = mapHash(leaves)

	levels = append(levels, currentLevel)

	for len(currentLevel) > 1 {
		var nextLevel []string = []string{}
		for i := 0; i < len(currentLevel); i += 2 {
			if i+1 < len(currentLevel) {
				hash := hashFunction(currentLevel[i] + currentLevel[i+1])
				nextLevel = append(nextLevel, hash)
			} else {
				nextLevel = append(nextLevel, hashFunction(currentLevel[i]+currentLevel[i]))
			}
		}
		levels = append(levels, nextLevel)
		currentLevel = nextLevel
	}
	return levels
}

func (tree *MerkleTree) getRoot() string {
	return tree.root
}

func main() {
	var data []string = []string{
		"Blockchain ensures data integrity through consensus.",
		"Merkle trees allow efficient verification of data chunks.",
		"Each leaf node represents a hashed data block.",
		"Parent nodes store hashes of their children.",
		"The root hash summarizes the entire dataset.",
	}
	tree := newMerkleTree(data)

	fmt.Println("Root Hash: ", tree.getRoot())
}