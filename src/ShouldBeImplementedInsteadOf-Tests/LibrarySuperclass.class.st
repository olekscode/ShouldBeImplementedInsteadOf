Class {
	#name : #LibrarySuperclass,
	#superclass : #Object,
	#category : #'ShouldBeImplementedInsteadOf-Tests'
}

{ #category : #'as yet unclassified' }
LibrarySuperclass class >> revertRenaming [	
	| env |
	env := RBNamespace onEnvironment:
		(RBClassEnvironment class: self).
	
	(RBRenameMethodRefactoring
		model: env
		renameMethod: #newMethod
		in: self
		to: #oldMethod
		permutation: Array new) execute.
]

{ #category : #'as yet unclassified' }
LibrarySuperclass class >> revertRenamingInAllSubclasses [
	<example>
	self allSubclasses do: [ :aClass |
		(aClass includesLocalSelector: #newMethod)
			ifTrue: [ aClass revertRenaming ] ].
]

{ #category : #'scrollbar-brick-accessing' }
LibrarySuperclass >> newMethod [
	<ignoreForCoverage>
	self shouldBeImplementedInsteadOf: #oldMethod.
]

{ #category : #accessing }
LibrarySuperclass >> oldMethod [
	"For some reason, library developers may decide to keep the oldMethod alongside the new one.
	It should not be rewritten"
	<ignoreForCoverage>
]
