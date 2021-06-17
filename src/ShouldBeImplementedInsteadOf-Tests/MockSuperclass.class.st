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

{ #category : #'as yet unclassified' }
MockSuperclass class >> revertRenaming [	
	| env |
	
	env := RBNamespace onEnvironment:
		(RBClassEnvironment class: self).
	
	(RBRenameMethodRefactoring
		model: env
		renameMethod: #bar
		in: self
		to: #foo
		permutation: Array new) execute.
]

{ #category : #'as yet unclassified' }
MockSuperclass class >> revertRenamingInAllSubclasses [
	<example>
	self allSubclasses do: [ :aClass |
		(aClass includesLocalSelector: #bar)
			ifTrue: [ aClass revertRenaming ] ].
]

{ #category : #'scrollbar-brick-accessing' }
MockSuperclass >> bar [
	self shouldBeImplementedInsteadOf: #foo.
]
