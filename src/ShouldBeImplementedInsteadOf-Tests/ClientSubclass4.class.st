Class {
	#name : #ClientSubclass4,
	#superclass : #ClientSubclass3,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #'as yet unclassified' }
ClientSubclass4 >> methodThatCallsOldMethod [
	<ignoreForCoverage>
	self oldMethod
]

{ #category : #accessing }
ClientSubclass4 >> oldMethod [
	<ignoreForCoverage>
	"do nothing"
]
