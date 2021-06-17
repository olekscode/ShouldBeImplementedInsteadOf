Class {
	#name : #MockSuperclass,
	#superclass : #Object,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #examples }
MockSuperclass class >> example [
	<example>
	self new bar
]

{ #category : #'scrollbar-brick-accessing' }
MockSuperclass >> bar [
	self shouldBeImplementedInsteadOf: #foo.
]
