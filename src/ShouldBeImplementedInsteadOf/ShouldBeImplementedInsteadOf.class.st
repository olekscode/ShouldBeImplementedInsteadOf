Class {
	#name : #ShouldBeImplementedInsteadOf,
	#superclass : #ShouldBeImplemented,
	#instVars : [
		'oldSelector',
		'receiverClass',
		'concernedParentClass'
	],
	#category : #ShouldBeImplementedInsteadOf
}

{ #category : #signalling }
ShouldBeImplementedInsteadOf class >> signalFor: aSelector insteadOf: anOldSelector in: aReceiverClass upUntil: aConcernedParentClass [
	 ^ self new
		selector: aSelector;
		oldSelector: anOldSelector;
		receiverClass: aReceiverClass;
		concernedParentClass: aConcernedParentClass;
		signal.
]

{ #category : #accessing }
ShouldBeImplementedInsteadOf >> concernedParentClass: aClass [
	concernedParentClass := aClass
]

{ #category : #accessing }
ShouldBeImplementedInsteadOf >> oldSelector: aSelector [
	oldSelector := aSelector
]

{ #category : #accessing }
ShouldBeImplementedInsteadOf >> receiverClass: aClass [
	receiverClass := aClass
]

{ #category : #'instance creation' }
ShouldBeImplementedInsteadOf >> rename: anOldSelector to: aNewSelector in: aClass [
	| environment permutation |
	
	environment := RBNamespace onEnvironment:
		(RBClassEnvironment class: aClass).
	
	"No permutation."
	permutation := (1 to: (aClass >> oldSelector) argumentNames size) asArray.
	
	(RBRenameMethodRefactoring
		model: environment
		renameMethod: anOldSelector
		in: aClass
		to: aNewSelector
		permutation: permutation) execute.
]

{ #category : #signalling }
ShouldBeImplementedInsteadOf >> signal [
	| hierarchyUntilConcernedParent hierarchyWithSubclasses classesToRewrite |
	
	hierarchyUntilConcernedParent := receiverClass allSuperclassesIncluding: concernedParentClass.
	
	hierarchyUntilConcernedParent
		addFirst: receiverClass;
		removeLast;
		reverse.
		
	(hierarchyUntilConcernedParent
		anySatisfy: [ :aClass | aClass includesLocalSelector: oldSelector ])
		ifFalse: [ super signal ].
		
	hierarchyWithSubclasses := hierarchyUntilConcernedParent, receiverClass allSubclasses.

	classesToRewrite := hierarchyWithSubclasses
		select: [ :aClass | aClass includesLocalSelector: oldSelector ].
		
	classesToRewrite do: [ :aClass |
		self rename: oldSelector to: selector in: aClass ].
]
