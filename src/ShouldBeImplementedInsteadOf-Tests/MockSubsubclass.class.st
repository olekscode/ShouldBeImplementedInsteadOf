Class {
	#name : #MockSubsubclass,
	#superclass : #MockSubclass,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #examples }
MockSubsubclass class >> example [
	<example>
	self new bar
]

{ #category : #accessing }
MockSubsubclass >> foo [
	"do nothing"
]
