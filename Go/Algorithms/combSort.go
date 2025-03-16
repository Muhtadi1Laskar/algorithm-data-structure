package main

func CombSort(arr []int) {
	n := len(arr)
	gap := n
	swapped := true

	for gap > 1 || swapped {
			gap = int(float64(gap) / 1.3)
			if gap < 1 {
					gap = 1
			}

			swapped = false
			for i := 0; i < n-gap; i++ {
					if arr[i] > arr[i+gap] {
							temp := arr[i]
							arr[i] = arr[i+gap]
							arr[i+gap] = temp
							swapped = true
					}
			}
	}
}