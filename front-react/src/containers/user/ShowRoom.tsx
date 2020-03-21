import React from "react";

type ShowRoomProps = {
    match : any,
}

export function ShowRoom ({...showRoomProps} : ShowRoomProps) {
    console.log(showRoomProps.match);
    return (
        <div>
            Show Room Page
        </div>
    )
}