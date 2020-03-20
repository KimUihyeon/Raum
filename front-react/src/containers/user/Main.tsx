import React from "react";

type MainProps = {
    match: any
}

export function Main({ match }: MainProps) {
    console.log(match.params)
    return (
        <div>mainPage 뜸 어드민 ??</div>
    )
}