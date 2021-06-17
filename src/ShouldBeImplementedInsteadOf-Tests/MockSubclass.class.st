Class {
	#name : #MockSubclass,
	#superclass : #MockSuperclass,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #examples }
MockSubclass class >> example [
	<example>
	self new foo
]

{ #category : #accessing }
MockSubclass >> foo [
	"do nothing"
]
