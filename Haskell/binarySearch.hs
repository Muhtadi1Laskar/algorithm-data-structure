search :: (a -> a -> Maybe a) -> (a -> Bool) -> a -> a -> (a,a)
search mid p = go
  where
    go l r = case mid l r of
      Nothing -> (l,r)
      Just m
        | p m       -> go l m
        | otherwise -> go m r