Class {
	#name : #ClientSubclass3,
	#superclass : #ClientSubclass1,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #'as yet unclassified' }
ClientSubclass3 >> methodThatCallsOldMethod [
	self oldMethod
]

{ #category : #accessing }
ClientSubclass3 >> oldMethod [
	"do nothing"
]
