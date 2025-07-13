proc solve(goal: int, standing: seq[int], score: int, chosenForSum: seq[int]): seq[int] =
  if score == goal:
    return chosenForSum
  elif score > goal or standing.len == 0:
    return @[]
  else:
    let currentNum: int = standing[0]
    let remainingNums: seq[int] = standing[1 ..< standing.len]
    let resultIfChosen: seq[int] = solve(goal, remainingNums, currentNum + score, chosenForSum & @[currentNum])

    if resultIfChosen.len > 0:
      return resultIfChosen
    
    return solve(goal, remainingNums, score, chosenForSum) 

when isMainModule:
  let numbers: seq[int] = @[15, 9, 30, 21, 19, 3, 12, 6, 25, 27]
  let targetGoal = 50

  let result = solve(targetGoal, numbers, 0, @[])

  echo result