module Dashboard.Details exposing (..)

import Dashboard.Group as Group
import Monocle.Lens
import Time exposing (Time)


type alias Details r =
    { r
        | now : Time
        , dragState : Group.DragState
        , dropState : Group.DropState
        , showHelp : Bool
    }


nowLens : Monocle.Lens.Lens (Details r) Time.Time
nowLens =
    Monocle.Lens.Lens .now (\t ss -> { ss | now = t })


dragStateLens : Monocle.Lens.Lens (Details r) Group.DragState
dragStateLens =
    Monocle.Lens.Lens .dragState (\ds ss -> { ss | dragState = ds })


dropStateLens : Monocle.Lens.Lens (Details r) Group.DropState
dropStateLens =
    Monocle.Lens.Lens .dropState (\ds ss -> { ss | dropState = ds })


toggleHelp : Details r -> Details r
toggleHelp details =
    { details | showHelp = not details.showHelp }
