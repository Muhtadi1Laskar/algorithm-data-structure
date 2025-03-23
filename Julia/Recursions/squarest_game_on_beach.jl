function solve(goal, standing, score=0, dropped=[])
    if goal == score
        return dropped
        elseif score > goal || length(standing) == 0
            return Nothing
        else
            chosen = standing[0]
            others = standing[1:length(standing)]

            return (solve(goal, others, score + chosen, standing+[chosen]) ||
                solve(goal, score, standing, dropped)
            )
        end
    end
     
println(solve(50, [15, 9, 30, 21, 19, 3, 12, 6, 25, 27]))