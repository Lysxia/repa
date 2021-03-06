
-- | Option types are similar to @Maybe a@, @Maybe (a, b)@ and so on, 
--   except they are directly unpacked into the constructor and are
--   strict in each component.
--
module Data.Repa.Scalar.Option
        ( -- * Single component
          Option  (..)
        , fromOption,  toOption

          -- * Two components
        , Option2 (..)
        , fromOption2, toOption2

          -- * Three components
        , Option3 (..)
        , fromOption3, toOption3

          -- * Four components
        , Option4 (..)
        , fromOption4, toOption4)
where


-------------------------------------------------------------------------------
-- | A strict `Maybe` type.
data Option a
        = Some !a
        | None 
        deriving (Eq, Ord, Show)


-- | Convert a `Maybe` to an `Option`.
toOption :: Maybe a -> Option a
toOption Nothing        = None
toOption (Just x)       = Some x
{-# INLINE toOption #-}


-- | Convert an `Option` to a `Maybe`.
fromOption :: Option a -> Maybe a
fromOption None         = Nothing
fromOption (Some x)     = Just x
{-# INLINE fromOption #-}


instance Functor Option where
 fmap _ None     = None
 fmap f (Some x) = Some (f x)
 {-# INLINE fmap #-}


-------------------------------------------------------------------------------
-- | A strict `Maybe` type, with two parameters.
data Option2 a b
        = Some2 !a !b
        | None2 
        deriving (Eq, Ord, Show)


-- | Convert a `Maybe` to an `Option2`.
toOption2 :: Maybe (a, b) -> Option2 a b
toOption2 Nothing        = None2
toOption2 (Just (x, y))  = Some2 x y
{-# INLINE toOption2 #-}


-- | Convert an `Option2` to a `Maybe`.
fromOption2 :: Option2 a b -> Maybe (a, b)
fromOption2 None2        = Nothing
fromOption2 (Some2 x y)  = Just (x, y)
{-# INLINE fromOption2 #-}


instance Functor (Option2 a) where
 fmap _ None2       = None2
 fmap f (Some2 x y) = Some2 x (f y)
 {-# INLINE fmap #-}


-------------------------------------------------------------------------------
-- | A strict `Maybe` type with three parameters.
data Option3 a b c
        = Some3 !a !b !c
        | None3 
        deriving (Eq, Ord, Show)


-- | Convert a `Maybe` to an `Option3`.
toOption3 :: Maybe (a, b, c) -> Option3 a b c
toOption3 Nothing          = None3
toOption3 (Just (x, y, z)) = Some3 x y z
{-# INLINE toOption3 #-}


-- | Convert an `Option2` to a `Maybe`.
fromOption3 :: Option3 a b c -> Maybe (a, b, c)
fromOption3 None3          = Nothing
fromOption3 (Some3 x y z)  = Just (x, y, z)
{-# INLINE fromOption3 #-}


instance Functor (Option3 a b) where
 fmap _ None3         = None3
 fmap f (Some3 x y z) = Some3 x y (f z)
 {-# INLINE fmap #-}


-------------------------------------------------------------------------------
-- | A strict `Maybe` type with four parameters.
data Option4 a b c d
        = Some4 !a !b !c !d
        | None4 
        deriving (Eq, Ord, Show)


-- | Convert a `Maybe` to an `Option4`.
toOption4 :: Maybe (a, b, c, d) -> Option4 a b c d
toOption4 Nothing                 = None4
toOption4 (Just (x1, x2, x3, x4)) = Some4 x1 x2 x3 x4
{-# INLINE toOption4 #-}


-- | Convert an `Option2` to a `Maybe`.
fromOption4 :: Option4 a b c d -> Maybe (a, b, c, d)
fromOption4 None4                 = Nothing
fromOption4 (Some4 x1 x2 x3 x4)   = Just (x1, x2, x3, x4)
{-# INLINE fromOption4 #-}


instance Functor (Option4 a b c) where
 fmap _ None4           = None4
 fmap f (Some4 x y z a) = Some4 x y z (f a)
 {-# INLINE fmap #-}

