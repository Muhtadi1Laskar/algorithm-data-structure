import std/sequtils

proc solve(goal: int, standing: seq[int], score: int, chosenForSum: seq[int]): seq[int] =
  if score == goal:
    return chosenForSum
  elif score > goal or standing.len == 0:
    return seq[int](nil)
  else:
    let currentNum = standing[0]
    let remainingNums = standing[1 ..< standing.len]
    let resultIfChosen = solve(goal, remainingNums, currentNum + score, chosenForSum & @[currentNum])

    if resultIfChosen != nil:
      return resultIfChosen
    
    return solve(goal, remainingNums, score, chosenForSum) 

when isMainModule:
  let numbers: seq[int] = @[15, 9, 30, 21, 19, 3, 12, 6, 25, 27]
  let targetGoal = 50

  let result = solve(targetGoal, numbers, 0, @[])

  echo result