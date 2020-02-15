module Children where

import Prelude


import Data.Const (Const)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP


type Slot = H.Slot (Const Void) Void


-- Very simple component for the potato description
potato :: forall m. H.Component HH.HTML (Const Void) String Void m
potato =
  H.mkComponent { initialState: identity
                , render: renderPotato
                , eval: H.mkEval $ H.defaultEval
                }

renderPotato :: forall m . String -> H.ComponentHTML Void () m
renderPotato state = HH.div_ [ HH.h2_ [ HH.text state ]
                              , HH.p_ [ HH.text $ "Here is some fascinating and informative information pertaining to the " <>
                                        state <>
                                        " potato" ]
                              , HH.p_ [ HH.text "It's a great potato. Amazing potato." ]
                             ]


-- Very simple component for roast potatoes
roast :: forall m.  H.Component HH.HTML (Const Void) Unit Void m
roast =
  H.mkComponent { initialState: const unit
                , render: renderRoast
                , eval: H.mkEval $ H.defaultEval
                }

renderRoast :: forall m . Unit -> H.ComponentHTML Void () m
renderRoast _ = HH.ul_ [ HH.li_ [ HH.a [ HP.href "#potato/Adrianne" ]
                                  [ HH.text "Adrianne" ] ]
                       , HH.li_ [ HH.a [ HP.href "#potato/Carolus" ]
                                  [ HH.text "Carolus" ] ]
                       ]


-- Very simple component for chips
chips :: forall m.  H.Component HH.HTML (Const Void) Unit Void m
chips =
  H.mkComponent { initialState: const unit
                , render: renderChips
                , eval: H.mkEval $ H.defaultEval
                }

renderChips :: forall m . Unit -> H.ComponentHTML Void () m
renderChips _ = HH.ul_ [ HH.li_ [ HH.a [ HP.href "#potato/Maris Piper" ]
                                  [ HH.text "Maris Piper" ] ]
                       , HH.li_ [ HH.a [ HP.href "#potato/Spanish Argia" ]
                                  [ HH.text "Spanish Agria" ] ]
                       , HH.li_ [ HH.a [ HP.href "#potato/Cara" ]
                                  [ HH.text "Cara" ] ]
                       ]


-- Very simple component for salad potatos
salad :: forall m .  H.Component HH.HTML (Const Void) Unit Void m
salad =
  H.mkComponent { initialState: const unit
                , render: renderSalad
                , eval: H.mkEval $ H.defaultEval
                }

renderSalad :: forall m . Unit -> H.ComponentHTML Void () m
renderSalad _ = HH.ul_ [ HH.li_ [ HH.a [ HP.href "#potato/Athlete" ]
                                  [ HH.text "Athlete" ] ]
                       , HH.li_ [ HH.a [ HP.href "#potato/Pink Fir" ]
                                  [ HH.text "Pink Fir" ] ]
                       ]

-- Component to handle a dud route.
dud :: forall m . H.Component HH.HTML (Const Void) Unit Void m
dud =
  H.mkComponent { initialState: const unit
                , render: renderDud
                , eval: H.mkEval $ H.defaultEval
                }

renderDud :: forall m . Unit -> H.ComponentHTML Void () m
renderDud _ = HH.div_ [ HH.text "An invalid route was selected" ]

