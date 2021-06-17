Class {
	#name : #ClientSubclass2,
	#superclass : #LibrarySuperclass,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #'as yet unclassified' }
ClientSubclass2 >> methodThatCallsOldMethod [
	self oldMethod
]

{ #category : #accessing }
ClientSubclass2 >> oldMethod [
	"do nothing"
]
