# ShouldBeImplementedInsteadOf

![Build status](https://github.com/olekscode/ShouldBeImplementedInsteadOf/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/ShouldBeImplementedInsteadOf/badge.svg?branch=master)](https://coveralls.io/github/olekscode/ShouldBeImplementedInsteadOf?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/ShouldBeImplementedInsteadOf/master/LICENSE)

A prototype warning for Pharo that allows us to automatically rename implementors

## How to install it?

To install `ShouldBeImplementedInsteadOf`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'ShouldBeImplementedInsteadOf';
  repository: 'github://olekscode/ShouldBeImplementedInsteadOf/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `ShouldBeImplementedInsteadOf` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'ShouldBeImplementedInsteadOf'
  with: [ spec repository: 'github://olekscode/ShouldBeImplementedInsteadOf/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?

```Smalltalk
self shouldBeImplementedInsteadOf: #oldMethodName
```
