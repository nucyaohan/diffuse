module Authentication.Types exposing (..)

import Json.Encode


-- Settings Types

import Playlists.Types as Playlists
import Sources.Types as Sources
import Tracks.Types as Tracks


-- Messages


type Msg
    = Extraterrestrial AlienMsg AlienResult
    | PerformSignIn Method
    | PerformSignOut
      -- Local User Data
    | ClearLocalUserData
    | RetrieveLocalUserData
    | RetrievedLocalUserData (Maybe String)
    | StoreLocalUserData String



-- Model


type alias Model =
    { method : Maybe Method
    , signedIn : Bool
    }



-- Talking to the outside world


type AlienMsg
    = MethodGet
    | MethodSet
    | MethodUnset
      --
    | Construct
    | Deconstruct
    | IsSignedIn
    | IsSigningIn
    | HandleSignInProcess
    | SignIn
    | SignOut
    | GetData
    | StoreData


type alias AlienResult =
    Result String Json.Encode.Value



-- Other


type Method
    = Blockstack
    | Local
    | RemoteStorage


type alias UserData =
    { favourites : Maybe (List Tracks.Favourite)
    , playlists : Maybe (List Playlists.Playlist)
    , settings : Maybe Json.Encode.Value
    , sources : Maybe (List Sources.Source)
    , tracks : Maybe (List Tracks.Track)
    }


type alias AdditionalUserData =
    { settings : Maybe Json.Encode.Value
    }
