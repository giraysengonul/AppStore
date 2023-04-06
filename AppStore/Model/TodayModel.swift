//
//  TodayModel.swift
//  AppStore
//
//  Created by hakkı can şengönül on 6.04.2023.
//


import Foundation
struct Today{
    let featuredTitle: String
    let headTitle: String
    let detailTitle1: String
    let title1: String
    let detailTitle2: String
    let title2: String
    let imageName: String
}

let modelData: [Today] = [
    Today(featuredTitle: "Featured Game" ,headTitle: "Build your dream house",detailTitle1: "Austin isn’t your typical videogame hero. ", title1: "After moving back in with his parents, the bow-tie-wearing butler decides to spruce up their dusty, dated home. Solve engaging match-3 puzzles to redecorate and turn the place into a beautifully made-over mansion.",detailTitle2: "What we love:",title2: "Putting our personal touch on the sprawling estate. Wallpaper, sofas, bookshelves, aquariums – every upgrade comes in multiple options that let you go as retro or as modern as you like. With all sorts of areas to unlock (including a boathouse and massive courtyard), Homescapes will give your design skills a serious workout.", imageName: "game"),
Today(featuredTitle: "Featured App" ,headTitle: "Notes with focus", detailTitle1: "Intentionally minimalist ", title1: "and accessible via the menu bar or a keyboard shortcut, Tot is a place to quickly jot down ideas, lists and notes – and have them be instantly available across all your devices. Instead of replacing other notes apps, in other words, Tot aims to complement them.", detailTitle2: "What we love: ", title2: "Tot’s simplicity. You’re limited to seven – and only seven – notes, each accessed via a circular button in the app’s toolbar: grey circles are empty, while coloured circles indicate notes where you’ve added text. Formatting is also simplified – just bold, italics, lists and links – so you can focus on substance rather than style. Prefer Markdown? Paste rich text into a Markdown note and Tot converts it on the fly, and vice versa.", imageName: "notes")


]

