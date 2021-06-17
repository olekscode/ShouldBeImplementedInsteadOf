Class {
	#name : #MockSubsubclass,
	#superclass : #MockSubclass,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #examples }
MockSubsubclass class >> example [
	<example>
	self new foo
]

{ #category : #accessing }
MockSubsubclass >> foo [
	"do nothing"
]
