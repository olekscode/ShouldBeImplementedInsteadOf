Class {
	#name : #BaselineOfShouldBeImplementedInsteadOf,
	#superclass : #BaselineOf,
	#category : #BaselineOfShouldBeImplementedInsteadOf
}

{ #category : #baselines }
BaselineOfShouldBeImplementedInsteadOf >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"Packages"
		spec 
			package: 'ShouldBeImplementedInsteadOf';
			package: 'ShouldBeImplementedInsteadOf-Tests'
				with: [ spec requires: #('ShouldBeImplementedInsteadOf') ] ].
]
