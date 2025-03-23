def solve(goal, standing, score=0, dropped=[]):
    if goal == score:
        return dropped
    elif score > goal or len(standing) == 0:
        return None
    else:
        chosen = standing[0]
        others = standing[1:]
        return solve(goal, others, score + chosen, dropped + [chosen]) or solve(
            goal, others, score, dropped
        )


print(solve(50, [15, 9, 30, 21, 19, 3, 12, 6, 25, 27]))
