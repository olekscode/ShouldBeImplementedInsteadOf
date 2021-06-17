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

{ #category : #signalling }
ShouldBeImplementedInsteadOf >> signal [
	| hierarchyUntilConcernedParent hierarchyWithSubclasses classesToRewrite environment permutation |
	
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
		
	environment := RBNamespace onEnvironment:
		(RBPackageEnvironment packages: 
			(classesToRewrite collect: #package) asSet asArray).
		
	classesToRewrite do: [ :aClass |
		"No permutation."
		permutation := (1 to: (aClass >> oldSelector) argumentNames size) asArray.
	
		(RBRenameMethodRefactoring
			model: environment
			renameMethod: oldSelector
			in: aClass
			to: selector
			permutation: permutation) execute ].
]
