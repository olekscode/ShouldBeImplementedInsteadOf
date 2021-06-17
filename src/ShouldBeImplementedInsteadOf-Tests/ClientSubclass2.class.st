Class {
	#name : #ClientSubclass2,
	#superclass : #LibrarySuperclass,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #'as yet unclassified' }
ClientSubclass2 >> methodThatCallsOldMethod [
	<ignoreForCoverage>
	self oldMethod
]

{ #category : #accessing }
ClientSubclass2 >> oldMethod [
	<ignoreForCoverage>
	"do nothing"
]
