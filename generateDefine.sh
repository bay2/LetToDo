#!/bin/bash

swiftgen colors colors.txt > LetToDo/Define/ColorsDefine.swift -t swift3
swiftgen images LetToDo/Assets.xcassets/ > LetToDo/Define/ImageDefine.swift -t swift3
swiftgen storyboards LetToDo/ > LetToDo/Define/StoryboardDefine.swift -t swift3
