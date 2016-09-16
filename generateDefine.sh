#!/bin/bash

swiftgen colors colors.txt > LetToDo/Define/ColorsDefine.swift
swiftgen images LetToDo/Assets.xcassets/ > LetToDo/Define/ImageDefine.swift
swiftgen storyboards ./ > LetToDo/Define/StoryboardDefine.swift
