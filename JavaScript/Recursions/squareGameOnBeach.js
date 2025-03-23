const solve = (goal, standing, score=0, dropped=[]) => {
  if (goal === score) {
    return dropped;
  } else if (score > goal || standing.length === 0) {
    return null;
  } else {
    const selected = standing[0];
    const others = standing.slice(1);

    return (
        solve(goal, others, score + selected, [...dropped, selected]) ||
        solve(goal, others, score, dropped)
    );
  }
};

console.log(solve(50, [15, 9, 30, 21, 19, 3, 12, 6, 25, 27]));