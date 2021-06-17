Class {
	#name : #ClientSubclass3,
	#superclass : #ClientSubclass1,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #'as yet unclassified' }
ClientSubclass3 >> methodThatCallsOldMethod [
	<ignoreForCoverage>
	self oldMethod
]

{ #category : #accessing }
ClientSubclass3 >> oldMethod [
	<ignoreForCoverage>
	"do nothing"
]
